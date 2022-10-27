<script lang="ts">
  import Avatar from "./Avatar.svelte";

  let editAccount = false;
  let loading = false;
  let username: string | null = null;
  let website: string | null = null;
  let avatarUrl: string | null = null;
  let bio: string | null = null;

  function toggle() {
    editAccount = !editAccount;
  }

</script>

{#if editAccount}
  <form class="form-widget">
    <Avatar edit={true} />
    <div>Email: </div>
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
  <Avatar edit={false} />

  <button type="button" class="button" on:click={toggle}>edit profile</button>
{/if}

<style>
  .inline {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
  }
</style>
