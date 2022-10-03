<script lang="ts">
  import { onMount } from "svelte";
  import type { AuthSession } from "@supabase/supabase-js";
  import { supabase } from "../supabaseClient";
  import Avatar from "./Avatar.svelte";

  export let session: AuthSession;

  let editAccount = false;
  let loading = false;
  let username: string | null = null;
  let website: string | null = null;
  let avatarUrl: string | null = null;
  let bio: string | null = null;

  onMount(() => {
    getProfile();
  });

  function toggle() {
    editAccount = !editAccount;
  }

  const getProfile = async () => {
    try {
      loading = true;
      const { user } = session;

      const { data, error, status } = await supabase
        .from("profiles")
        .select("username, website, avatar_url, bio")
        .eq("id", user.id)
        .single();

      if (error && status !== 406) throw error;

      if (data) {
        username = data.username;
        website = data.website;
        avatarUrl = data.avatar_url;
        bio = data.bio;
      }
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message);
      }
    } finally {
      loading = false;
    }
  };

  const updateProfile = async () => {
    try {
      loading = true;
      const { user } = session;

      const updates = {
        id: user.id,
        username,
        website,
        avatar_url: avatarUrl,
        bio,
        updated_at: new Date().toISOString(),
      };

      let { error } = await supabase.from("profiles").upsert(updates);

      if (error) {
        throw error;
      }
    } catch (error) {
      if (error instanceof Error) {
        alert(error.message);
      }
    } finally {
      loading = false;
    }
  };
</script>

{#if editAccount}
  <form on:submit|preventDefault={updateProfile} class="form-widget">
    <Avatar bind:url={avatarUrl} on:upload={updateProfile} edit={true} />
    <div>Email: {session.user.email}</div>
    <div>
      <label for="username">Name</label>
      <input id="username" type="text" bind:value={username} />
    </div>
    <div>
      <label for="website">Website</label>
      <input id="website" type="text" bind:value={website} />
    </div>
    <div>
      <label for="bio">Bio</label>
      <textarea id="bio" type="text" bind:value={bio} />
    </div>
    <div class="inline">
      <button type="submit" class="button primary block" disabled={loading}>
        {loading ? "Saving ..." : "Update profile"}
      </button>

      <button class="button secondary block" on:click={toggle}>cancel</button>
    </div>
  </form>
{:else}
  <Avatar bind:url={avatarUrl} edit={false} />

  <button type="button" class="button" on:click={toggle}>edit profile</button>
{/if}

<style>
  .inline {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
  }
</style>
