<script lang="ts">
  import { onMount } from "svelte";
  import { supabase } from "../supabaseClient";

  let attendingCount = 0;
  let maybeCount = 0;

  onMount(() => {
    getRsvpCounts();
  });

  async function getRsvpCounts() {
    const { count: countYes } = await supabase
      .from("rsvp")
      .select("attending", { count: "exact" })
      .eq("attending", "yes");

    if (countYes) {
      attendingCount = countYes;
    }

    const { count: countMaybe } = await supabase
      .from("rsvp")
      .select("attending", { count: "exact" })
      .eq("attending", "maybe");

    if (countYes) {
      maybeCount = countMaybe;
    }
  }
</script>

<span class="count">
  {attendingCount}
  {attendingCount === 1 ? "person" : "people"} attending! {maybeCount > 0
    ? `(${maybeCount} maybe)`
    : ""}
</span>

<style>
  .count {
    margin-top: -2em;
  }

  @media (max-width: 700px) {
    .count {
      font-size: 0.75em;
      text-align: center;
    }
  }
</style>
