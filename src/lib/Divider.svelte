<!-- https://codepen.io/t_afif/pen/eYMqzKg -->
<div class="line" />

<style>
  .line {
    --size: 5px;
    --b: 4px;
    --p: 0.5px;
    --R: calc(5px + var(--b) / 2);

    --_g: #0000 calc(99% - var(--b)), #000 calc(101% - var(--b)) 99%, #0000 101%;
    -webkit-mask: radial-gradient(
          var(--R) at left 50% bottom calc(-1 * var(--p)),
          var(--_g)
        )
        calc(50% - 2 * var(--size)) calc(50% - var(--size) / 2 - var(--b) / 2) /
        calc(4 * var(--size)) calc(var(--size) + var(--b)) repeat-x,
      radial-gradient(var(--R) at left 50% top calc(-1 * var(--p)), var(--_g))
        50% calc(50% + var(--size) / 2 + var(--b) / 2) / calc(4 * var(--size))
        calc(var(--size) + var(--b)) repeat-x;
    background: linear-gradient(90deg, red, blue);
    height: 50px;
    overflow: hidden;
  }
</style>
