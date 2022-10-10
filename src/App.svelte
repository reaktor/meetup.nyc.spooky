<script lang="ts">
  import { onMount } from "svelte";
  import { supabase } from "./supabaseClient";
  import type { AuthSession } from "@supabase/supabase-js";

  import Horror from "./lib/Horror.svelte";
  import Info from "./lib/Info.svelte";

  let session: AuthSession;
  let open = false;

  onMount(() => {
    supabase.auth.getSession().then(({ data }) => {
      session = data.session;
    });

    supabase.auth.onAuthStateChange((_event, _session) => {
      session = _session;
    });
  });

  function toggle() {
    if (!open) {
      open = true;
    }
  }

  function close() {
    open = false;
  }
</script>

{#if !open}
  <Info />
{/if}

<Horror {session} {open} {toggle} {close} />
