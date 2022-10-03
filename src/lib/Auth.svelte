<script lang="ts">
  import { supabase } from "../supabaseClient";

  let loading = false;
  let email = "";
  let responseMsg = "";

  const handleLogin = async () => {
    try {
      loading = true;
      const { error } = await supabase.auth.signInWithOtp({ email });
      if (error) throw error;
      responseMsg = "Check your email for login link!";
    } catch (error) {
      if (error instanceof Error) {
        responseMsg = error.message;
      }
    } finally {
      loading = false;
    }
  };
</script>

<div class="row flex-center flex">
  <div class="col-6 form-widget" aria-live="polite">
    {#if responseMsg}
      <h3>{responseMsg}</h3>
    {:else}
      <p class="description">Enter your email below to RSVP.</p>
      <form class="form-widget" on:submit|preventDefault={handleLogin}>
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
      </form>
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
