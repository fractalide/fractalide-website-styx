<div class="row">
    <div class="col-lg-offset-3 col-lg-6 col-md-offset-2 col-md-8 col-xs-offset-1 col-xs-10 text-center">
        <h2 class="sub_heading_blue">Instructions</h2>
        <p>Please follow the below to generate a luceo address</p>
        <ol>
          <li>Install the <a href="https://www.rust-lang.org/tools/install">Rust toolchain</a></li>
          <li><code>$ git clone --recursive https://github.com/input-output-hk/cardano-cli</code></li>
          <li><code>$ cd cardano-cli</code></li>
          <li><code>$ cargo build --release</code></li>
          <li>Carefully record all secret information being sure to write down the 24 word mnemonic words backing it up via pen and paper.</li>
          <li><code>$ ./target/release/cardano-cli blockchain new luceo-mainnet</code></li>
          <li><code>$ ./target/release/cardano-cli wallet create luceo</code></li>
          <li><code>$ ./target/release/cardano-cli wallet attach luceo luceo-mainnet</code></li>
          <li><code>$ ./target/release/cardano-cli wallet address luceo 0 0</code></li>
          <li>The output will look similar to this:  <code>Ae2tdPwUPEZ9M.................JKB9XXTvjfxNGzdmxEhRwC7S5g</code></li>
          <li>Now copy your generated address created on the command line and paste it into an email body where the email title is the code on your card, the destination email address ("to" field) can also be found on your card.</li>
        </ol>
    </div>
</div>
