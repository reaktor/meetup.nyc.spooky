<script lang="ts">
  export let edit: boolean;

  let avatarUrl: string = null;
  let uploading = false;
  let files: FileList;
</script>

<div aria-live="polite">
  {#if avatarUrl}
    <img
      src={avatarUrl}
      alt={avatarUrl ? "Avatar" : "No image"}
      class="avatar-image"
    />
  {:else}
    <div class="avatar no-image" />
  {/if}
  {#if edit}
    <div>
      <label class="button primary block upload-avatar" for="single">
        {uploading ? "Uploading ..." : "Upload avatar"}
      </label>
      <span style="display:none">
        <input
          type="file"
          id="single"
          accept="image/*"
          bind:files
          disabled={uploading}
        />
      </span>
    </div>
  {/if}
</div>

<style>
  .avatar-image {
    max-width: 150px;
    max-height: 150px;
  }
</style>
