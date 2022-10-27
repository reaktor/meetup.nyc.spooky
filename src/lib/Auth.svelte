<script lang="ts">
  let loading = false;
  let email = "";
  let responseMsg = "";
</script>

<div class="row flex-center flex">
  <div class="col-6 form-widget" aria-live="polite">
    {#if responseMsg}
      <h3>{responseMsg}</h3>
    {:else}
    <p class="description">IT'S OVER!</p>
      <!-- <p class="description">Enter your email below to RSVP.</p>
      <form class="form-widget">
        <div>
          <label for="email">Email</label>
          <input
            id="email"
            class="inputField"
            type="email"
            placeholder="Your email"
            bind:value={email}
          />
        </div>
        <div class="flex">
          <button
            type="submit"
            class="button primary block"
            aria-live="polite"
            disabled={loading || email.length < 5}
          >
            <span>{loading ? "Loading" : "RSVP"}</span>
          </button>
        </div>
      </form> -->
    {/if}
  </div>
</div>

<style>
  .flex {
    display: flex;
    justify-content: space-around;
    flex-direction: column;
  }
</style>
