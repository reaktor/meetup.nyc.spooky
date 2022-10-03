-- Create a table for Public Profiles
create table profiles (
  id uuid references auth.users not null,
  updated_at timestamp with time zone,
  username text unique,
  avatar_url text,
  website text,
  primary key (id),
  unique(username),
  constraint username_length check (char_length(username) >= 3)
);
alter table profiles enable row level security;
create policy "Public profiles are viewable by everyone." on profiles for
select using (true);
create policy "Users can insert their own profile." on profiles for
insert with check (auth.uid() = id);
create policy "Users can update own profile." on profiles for
update using (auth.uid() = id);
-- Set up Realtime!
begin;
drop publication if exists supabase_realtime;
create publication supabase_realtime;
commit;
alter publication supabase_realtime
add table profiles;
-- Set up Storage!
insert into storage.buckets (id, name)
values ('avatars', 'avatars');
create policy "Avatar images are publicly accessible." on storage.objects for
select using (bucket_id = 'avatars');
create policy "Anyone can upload an avatar." on storage.objects for
insert with check (bucket_id = 'avatars');
create policy "Anyone can update an avatar." on storage.objects for
update with check (bucket_id = 'avatars');
-- Create a table for RSVP
create table rsvp (
  id int8,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now(),
  user_id uuid references auth.users not null,
  updated_at timestamp with time zone,
  event_name text unique,
  attending text,
  primary key (id),
);
alter table profiles enable row level security;
create policy "Public profiles are viewable by everyone." on profiles for
select using (true);
create policy "Users can insert their own profile." on profiles for
insert with check (auth.uid() = id);
create policy "Users can update own profile." on profiles for
update using (auth.uid() = id);
-- create rsvp entry when new user is added function
create or replace function public.handle_new_user() returns trigger as $$ begin
insert into public.rsvp (user_id, event_name, attending)
values (new.id, 'spooky', 'maybe');
return new;
end;
$$ language plpgsql security definer;
-- and then trigger it!
create trigger on_auth_user_created
after
insert on auth.users for each row execute procedure public.handle_new_user();