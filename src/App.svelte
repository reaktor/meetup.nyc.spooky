<script lang="ts">
  import Horror from "./lib/Horror.svelte";
  import Info from "./lib/Info.svelte";

  let open = false;

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

<Horror {open} {toggle} {close} />
