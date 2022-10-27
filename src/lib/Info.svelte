<script>
  import RsvpCount from "./RsvpCount.svelte";
</script>

<div class="container">
  <div class="inline">
    <div class="titlecount">
      <i>ohey! this event happened and this page is left here for posterity.</i>
      <h1 class="header">
        👻 <b>S P O O K Y</b>
        🎃
      </h1>
      
      <RsvpCount />
    </div>
  </div>

  <div class="main">
    <p>
      a halloween themed tech meetup happening IRL in NYC! organized by
      <a href="http://edwardsharp.com">3dwardsharp</a>
    </p>

    <p>🗓 Monday, Oct. 24, 2022, 6pm - 9pm</p>

    <p>
      🏤 kindly hosted by Reaktor at their office: <a
        href="https://goo.gl/maps/vibXtcHdWYWeZ8wj6"
        title="google maps">30 w. 21st St. NYC, 14th floor.</a
      >
      <b
        >note: you will need to ask the person working at the front desk to let
        you up to the Reaktor office on the 14th floor.</b
      >
    </p>
    <p>
      🍕 food (pizza with vegan, vegetarian, and other options) and drinks
      provided
    </p>
    <p>
      😷 COVID safety: we kindly request that you wear a mask! there is outside
      balcony space where masks are optional, but please wear one while inside.
    </p>
    <p>
      🧟 capacity is limited to 50 people maximum, so please be realistic about
      your "yes" RSVP (you can come back here anytime and change it!)
    </p>
    <p>📹 this will not be live-streamed</p>
    <p>
      📜 we will follow the JSConf Code of Conduct, so check it out <a
        href="https://jsconf.com/codeofconduct.html"
        >jsconf.com/codeofconduct.html</a
      >
    </p>
    <p>
      ❓ questions? reach out to us at <a href="mailto:meetup.nyc@reaktor.fi"
        >meetup.nyc@reaktor.fi</a
      >
    </p>
    <p>
      🙋 interested in doing something in the future? let us know by adding
      something to our github repo:
      <a href="https://github.com/reaktor/meetup.nyc"
        >github.com/reaktor/meetup.nyc</a
      >
    </p>

    <h1 class="header presenting">
      👻 <b>P R E S E N T I N G</b>
      🎃
    </h1>

    <div class="presenter">
      <img
        src="briarsweetbriar.png"
        title="this is a graphic from an article dazed wrote about us last year"
        alt="this is a graphic from an article dazed wrote about us last year"
      />

      <h2>briar sweetbriar</h2>

      <p>she/her</p>
      <p>
        a child of the 90s, briar was excited by the radical potential of the
        early internet, though like many millennials, was disappointed by how
        that potential was enclosed by corporate behemoths and authoritarian
        policies. despite that disappointment, she started writing software 10
        years ago, working for numerous bay area startups, such as Pandora,
        Ticketfly, and Famous. in her spare time, she continues exploring ways
        to return to that original promise of the world wide web: trying to
        cultivate something resilient, beautiful, and egalitarian.
      </p>
      <p>
        anarcho-syndicalism is a political practice oriented around
        worker-ownership and horizontal decision-making. typically,
        anarcho-syndicalist businesses are small, ranging from bookstores with a
        dozen worker-owners to factories with a 100 people making decisions
        together. what if we took this model and applied it to an international
        web application? imagine etsy, but everyone selling on the marketplace
        could propose policies and vote on them. or imagine uber, but every
        driver had a voice and could argue to increase payouts or to prioritize
        the development of particular features. numerous web applications like
        this are under development today, and during this talk, we'll discuss
        the organizational structure and decision-making practices for one such
        project.
      </p>
      <p>
        <a href="https://github.com/briarsweetbriar"
          >github.com/briarsweetbriar</a
        >
      </p>
    </div>

    <div class="presenter">
      <img src="lucid00.jpeg" title="lucid00" alt="lucid00" />

      <h2>Hugh</h2>

      <p>He/him</p>
      <p>Freelance web developer/indie rapper</p>
      <p>
        What I'm up to: Building P2P web stuff in secret using WebTorrent,
        Hypercore and Secure Scuttlebutt, and making music.
      </p>
      <p><a href="https://twitter.com/lucid00">twitter.com/lucid00</a></p>
      <p><a href="http://lucid00.com">lucid00.com</a></p>
    </div>

    <div class="presenter">
      <img src="starlybri.jpg" title="starlybri" alt="starlybri" />

      <h2>Sabrina Sims (starlybri)</h2>

      <p>she/her</p>
      <p>
        Sabrina Sims is a Black Puerto Rican interdisciplinary artist from the
        Bronx, New York. She experiments with mediums including synth music,
        poetry, riso printing, zines and textiles. Magic, transformation and
        subversive self care/kindness are common threads in her work. Sabrina
        teaches community workshops, plays shows and gives artist talks as part
        of her practice.
      </p>
      <p>
        Sabrina will be showing a fall inspired AV installation-performance
        using her microfreak synthesizer, livecoded music in tidalcycles (build
        with Haskell) and visuals in hydra. She will be doing a relaxed Q&A
        following about her tech-art practice.
      </p>
      <p><a href="https://www.starlyart.studio/">starlyart.studio</a></p>
      <p><a href="https://twitter.com/starlybri">twitter.com/starlybri</a></p>
    </div>
  </div>
</div>

<div class="madewith">
  <a href="https://github.com/reaktor/meetup.nyc.spooky">made with 💖 in nyc</a>
</div>

<style>
  .container {
    /* text-align: center; */
    display: flex;
    flex-direction: column;
    margin-bottom: 250px;
  }

  .main {
    margin-top: 3em;
  }
  .inline {
    display: flex;
    flex-direction: row;
    justify-content: space-evenly;
  }

  .titlecount {
    display: flex;
    flex-direction: column;
    text-align: left;
  }

  .presenting {
    margin-top: 2em;
  }

  .presenter {
    padding: 3em 0;
    clear: both;
  }

  .presenter > img {
    float: left;
    margin-right: 1em;
    width: 33vw;
    border-radius: 10px;
  }

  .madewith {
    font-size: 0.75em;
  }
  @media (max-width: 700px) {
    .container {
      /* text-align: center; */
      display: flex;
      flex-direction: column;
      min-width: 80vw;
    }

    .inline {
      flex-direction: column;
    }
  }
</style>
