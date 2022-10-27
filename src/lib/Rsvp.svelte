<script lang="ts">

  export let showStatusOnly = false;

  let loading = false;
  let has_rsvp = false;
  let attendingUpdated = "";
  let attending: string | null = null;
  let event_name: string | null = null;

</script>

<div>
  {#if has_rsvp}
    <h3 hidden={showStatusOnly}>RSVP to {event_name}</h3>
    <form disabled={loading}>
      <label for="attending" hidden={showStatusOnly}>attending:</label>
      <select id="attending" value={attending}>
        {#if showStatusOnly}
          <option disabled>attending</option>
        {/if}
        <option value="yes"> yes </option>
        <option value="maybe"> maybe </option>
        <option value="no"> no </option>
      </select>
    </form>

    <div hidden={showStatusOnly}>{attendingUpdated}</div>
  {:else if !showStatusOnly}
    <button>RSVP!</button>
  {/if}
</div>
