# 👻 `S P O O K Y` 🎃

https://reaktor.github.io/meetup.nyc.spooky/

a spooky website made for gathering registrations for a spooky themed meetup on October 24, 2022 at Reaktor NYC.

built with:

🗣 [svelte](https://svelte.dev/)

🗣 [supabase](https://supabase.com/)


## note on posterity:

this event happened, the supabase instance was deleted, and the supabase parts of the code were yanked, see this commit for a stable example integrated with supabase: https://github.com/reaktor/meetup.nyc.spooky/releases/tag/stable

### local dev

`npm run dev`

note: you probably want to change (or remove) the `emailRedirectTo` over in [Auth.svelte](src/lib/Auth.svelte)

### deploy

will build and publish to github pages

`npm run deploy`

see also: [VITE-README](VITE-README.md)

see also: https://github.com/reaktor/meetup.nyc

see also: https://kinopio.club/s-p-o-o-k-y-EoaFRUwi8HyyjewL2BeY9
