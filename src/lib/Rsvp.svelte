<script lang="ts">
  import type { AuthSession } from "@supabase/supabase-js";
  import { onMount } from "svelte";
  import { supabase } from "../supabaseClient";

  export let session: AuthSession;

  let loading = false;
  let has_rsvp = false;
  let attendingUpdated = "";
  let attending: string | null = null;
  let event_name: string | null = null;

  onMount(() => {
    getRsvp();
  });

  async function getRsvp() {
    try {
      loading = true;
      const { user } = session;

      console.log("zomg user_id", user.id);
      const { data, error, status } = await supabase
        .from("rsvp")
        .select("user_id, created_at, event_name, attending")
        .eq("user_id", user.id)
        .single();

      if (error && status !== 406) throw error;

      if (data) {
        console.log("zomg rsvp data:", data);
        has_rsvp = true;
        attending = data.attending;
        event_name = data.event_name;
      }
    } catch (error) {
      console.warn(error);
    } finally {
      loading = false;
    }
  }

  async function createRsvp() {
    try {
      loading = true;

      const { user } = session;

      const { error, status } = await supabase.from("rsvp").insert({
        user_id: user.id,
        event_name: "spooky",
        attending: "maybe",
      });

      if (error && status !== 406) throw error;

      has_rsvp = true;
      attending = "maybe";
      event_name = "spooky";
    } catch (error) {
      console.warn(error);
    } finally {
      loading = false;
    }
  }

  async function updateRsvpAttending(attending: string) {
    try {
      loading = true;

      const { user } = session;

      const updates = {
        attending,
        updated_at: new Date().toISOString(),
      };

      const { data, error, status } = await supabase
        .from("rsvp")
        .update(updates)
        .match({ user_id: user.id, event_name });

      if (error && status !== 406) throw error;
    } catch (error) {
      console.warn(error);
    } finally {
      loading = false;
      attendingUpdated = "updated!";
    }
  }

  function onChange(event: Event) {
    const target = event.target as HTMLSelectElement; // hmm, :/
    console.log("onChnage", target.value);

    updateRsvpAttending(target.value).then(() => {
      attending = target.value;
    });
  }
</script>

<div>
  {#if has_rsvp}
    <h3>RSVP to {event_name}</h3>
    <form>
      <label for="attending">attending:</label>
      <select id="attending" value={attending} on:change={onChange}>
        <option value="yes"> attending </option>
        <option value="maybe"> maybe </option>
        <option value="no"> not attending </option>
      </select>
    </form>

    <div>{attendingUpdated}</div>
  {:else}
    <button on:click={createRsvp}>RSVP!</button>
  {/if}
</div>

<style>
  select {
    padding: 1em;
  }
</style>
