<div class="row">
    <div class="col-lg-offset-3 col-lg-6 col-md-offset-2 col-md-8 col-xs-offset-1 col-xs-10 text-center">
        <h2 class="sub_heading_blue">Instructions</h2>
        <h3>NOTE: currently we don't have a testnet available and thus you cannot just yet generate an address. Please email your code to the address on the card and we'll inform you when things are ready accompanied with appropriate instructions</h3>
        <p>The below will give you an idea of the process to generate a luceo address</p>
        <ol>
          <li>Install the <a href="https://www.rust-lang.org/tools/install">Rust toolchain</a></li>
          <li><code>$ git clone https://github.com/input-output-hk/cardano-cli</code></li>
          <li><code>$ cd cardano-cli</code></li>
          <li><code>$ cargo build --release</code></li>
          <li>Carefully record all secret information being sure to write down the 24 word mnemonic words backing it up via pen and paper.</li>
          <li><code>$ ./target/release/cardano-cli blockchain new luceo-mainnet</code></li>
          <li><code>$ ./target/release/cardano-cli wallet create luceo</code></li>
          <li><code>$ ./target/release/cardano-cli wallet attach luceo luceo-mainnet</code></li>
          <li><code>$ ./target/release/cardano-cli wallet address luceo 0 0</code></li>
          <li>Copy past the address, which'll look similar to this <code>Ae2tdPwUPEZ9MW89k5T9Fh4qRwztiddhUJKB9XXTvjfxNGzdmxEhRwC7S5g</code> and email it to the address on the card.</li>
        </ol>
    </div>
</div>
