<script lang="ts">
  import { onMount } from "svelte";
  import { supabase } from "./supabaseClient";
  import type { AuthSession } from "@supabase/supabase-js";
  import Account from "./lib/Account.svelte";
  import Auth from "./lib/Auth.svelte";
  import Rsvp from "./lib/Rsvp.svelte";
  import RsvpCount from "./lib/RsvpCount.svelte";
  import Divider from "./lib/Divider.svelte";

  let session: AuthSession;

  onMount(() => {
    supabase.auth.getSession().then(({ data }) => {
      session = data.session;
    });

    supabase.auth.onAuthStateChange((_event, _session) => {
      session = _session;
    });
  });
</script>

<div class="container" style="padding: 50px 0 100px 0">
  <div class="inline">
    <div class="titlecount">
      <h1 class="header">S P O O K Y</h1>
      <RsvpCount />
    </div>

    {#if session}
      <div class="signout">
        <button
          type="button"
          class="button block"
          on:click={() => supabase.auth.signOut()}
        >
          Sign Out
        </button>
      </div>
    {/if}
  </div>

  <Divider />
  {#if !session}
    <Auth />
  {:else}
    <Account {session} />
    <Divider />
    <Rsvp {session} />
  {/if}
</div>

<style>
  .container {
    text-align: center;
    display: flex;
    flex-direction: column;
    min-width: 50vw;
  }
  .inline {
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
  }

  .titlecount {
    display: flex;
    flex-direction: column;
    text-align: left;
  }

  .signout {
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  @media (max-width: 700px) {
    .container {
      text-align: center;
      display: flex;
      flex-direction: column;
      min-width: 80vw;
    }

    .inline {
      flex-direction: column;
    }
  }
</style>
