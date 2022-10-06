<script lang="ts">
  import { onMount } from "svelte";
  import { supabase } from "./supabaseClient";
  import type { AuthSession } from "@supabase/supabase-js";

  import RsvpCount from "./lib/RsvpCount.svelte";
  import Horror from "./lib/Horror.svelte";

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

<div class="container">
  <div class="inline">
    <div class="titlecount">
      <h1 class="header">S P O O K Y</h1>
      <RsvpCount />
    </div>
  </div>

  <Horror {session} />
</div>

<style>
  .container {
    text-align: center;
    display: flex;
    flex-direction: column;
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
