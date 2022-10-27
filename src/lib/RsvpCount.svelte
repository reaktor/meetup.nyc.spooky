<script lang="ts">

  let attendingCount = 24;
  let maybeCount = 7;


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
