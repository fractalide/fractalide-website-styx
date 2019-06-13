<div class="container">
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">Luceo ICO Tutorial</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                            <p>
                                (If a party pooper gave you this direct link, then you're missing out on the story. Return to page <a href="/ico/">99</a> of this choose your own adventure and try solve the puzzles to get back here.)
                            </p>
                            <p>
                                You made it this far, the past two challenges were a mere warm up. Getting through the next hurdle earns you, the hero, a sword that'll overcome centralised fat bankers and tech giant monopolies.
                            </p>
                            <p>
                                This tutorial will guide you through the process of getting your luceo address into the luceo mainnet genesis block. It's designed so that we never interact with your secret/private keys, making the process more secure.
                            </p>
                            <p>
                              There are 6 major steps:
                            </p>
                            <ol>
                              <li>Installing the required software to generate your cryptographic keys and luceo address</li>
                              <li>Upgrading Luceo to keep track of the genesis block regenerations during the ICO period</li>
                              <li>Generating your cryptographic keys and luceo address</li>
                              <li>Securing your cryptographic keys</li>
                              <li>Inserting the ICO payment which contains your luceo address into the Bitcoin (BTC) blockchain</li>
                              <li>Querying for your luceo address in the luceo genesis block</li>
                            </ol>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">1) Installing Luceo</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                            <p>
                                There are three ways of obtaining Luceo.
                                <ol>
                                  <li>Luceo binaries</li>
                                  <li>Build from source</li>
                                  <li>Using Nix</li>
                                </ol>
                            </p>
                            <h3>Most people will download Luceo binaries</h3>
                            <p>
                                <ol>
                                  <li><pre>Download Luceo from the <a href="https://github.com/fractalide/jormungandr-luceo/releases">downloads section</a></pre></li>
                                  <li><pre>C:\Users\u\Downloads> unzip jormungandr-luceo-version-x86_64-pc-windows-gnu.zip</pre></li>
                                  <li><pre>C:\Users\u\Downloads> start jcli.exe --help</pre></li>
                                </ol>
                            </p>
                            <h3>Programmers build from source</h3>
                            <p>
                                Run these commands on a Unix/BSD system.
                                <ol>
                                  <li><pre>Follow these <a href="https://www.rust-lang.org/tools/install">instructions</a> to install Rust.</pre></li>
                                  <li><pre>$ git clone --recursive https://github.com/fractalide/jormungandr-luceo</pre></li>
                                  <li><pre>$ cd jormungandr-luceo</pre></li>
                                  <li><pre>$ git tag</pre></li>
                                  <li><pre>$ git checkout &lt;latest tag&gt;</pre></li>
                                  <li><pre>$ export PRODUCTION_ADDRESS_PREFIX=ceo</pre></li>
                                  <li><pre>$ export TEST_ADDRESS_PREFIX=teo</pre></li>
                                  <li><pre>$ rustup run nightly cargo install</pre></li>
                                  <li><pre>$ cd ~/.cargo/bin/</pre></li>
                                  <li><pre>$ ./jcli --help</pre></li>
                                </ol>
                            </p>
                            <h3>Luceo stakepool operators build and run using Nix</h3>
                            <p>
                                If you intend on running a Luceo stakepool, these <a href="https://git.fractalide.org/fractalide/luceo">nix expression</a> are strongly recommended. They contain service modules descriptions which will automatically setup and configured your stakepool by pointing at the correct BFT nodes with the latest genesis block hash.
                            </p>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">2) Upgrading Luceo to keep track of the genesis block regenerations during the ICO period</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                            <p>
                                During the ICO period we'll be regenerating the genesis block every week or so. This is to include new ICO contributors so that they too may experiment with the luceo distributed ledger. If you wish to try out <code>jormungandr-luceo</code> stakepool software you'll need to make sure you upgrade your luceo software to keep up with the latest genesis block. If you only want to use the <code>luceo</code> application then this'll still work with other genesis blocks and thus doesn't need updating so often.
                            </p>
                            <p>
                                Your anonymous luceo address will be on the bitcoin blockchain permanently (using a memory efficient mechanism) and will be part of every luceo genesis block regeneration. Regeneration of the luceo genesis block will stop at the end of the ICO period. Maybe a small window will be needed between the end of the ICO period and <code>mainnet</code> to iron out any issues that might arise. Thus the ICO period acts as a <code>testnet</code> period, then we'll launch into <code>mainnet</code> at the end of the ICO period.
                            </p>
                            <p>
                                When the luceo genesis block is regenerated your luceo amount will be reset to the original amount. This allows you to experiment with luceo by sending coin to other accounts on the ledger. If you decide to purchase another batch of luceo during a later tranche then this'll be added to the original amount. Though once we shift into <code>mainnet</code> at the end of the ICO period, your coin won't be reset.
                            </p>
                            <p>
                                Please ensure your stakepool software is up to date. Users of the command line interface program <code>luceo[.exe]</code> may update their software less frequently.
                            </p>
                            <p>
                                For the moment <code>luceo</code> only supports a "blockchain-in-a-box" and isn't decentralised. Over the ICO period this will change allowing you to setup stakepools. At that point please do submit your stakepool key, allowing us to include your pool in the next genesis block regeneration. We'll then list your stakepool so others can see it and experiment with it. Thus when we launch <code>mainnet</code> we'll have a sufficiently large user base with enough decentralisation in the form of people running luceo stakepools.
                            </p>
                            <p>
                                Hence this ICO process also serves to choreograph and build out the initial decentralised network. It's critical for more experienced technical people to find and report exploits and bugs in the software, should they arise.
                            </p>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">3) Generating your cryptographic keys and luceo address</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                            <p>
                                Now you understand how to get <code>luceo</code> working, let's use it to generate your keys and address. You are about to generate three pieces of cryptographic information:
                                <ol>
                                  <li>Private Key or Secret Key</li>
                                  <li>Public Key</li>
                                  <li>Luceo Address</li>
                                </ol>
                            </p>
                            <h3>Private or Secret Key</h3>
                            <p>
                                Let's start with creating your secret key. Keep in mind, the example data is not your keys and will be different to the below.
                                Run this command:
                                <pre>$ jcli key generate --type ed25519Extended</pre>
                                You should see an output similar to this:
                                <pre>$ jcli key generate --type ed25519Extended
ed25519e_sk1prz97aenm5z0344087hyt2mpr26zrvh0ymcq9lpff3mw47fpwax8pxx24dynwwejm5uhccfr6rtuezcfqfev08urxv8zyls36zwe2psrx9cnm</pre>
                                The output is the secret key, a bit of explanation might be needed.
                                The initial <code>ed25519</code> indicates it's the digital signature scheme named Edwards-curve Digital Signature Algorithm. The <code>e</code> at the end of <code>ed25519e</code> indicates that it contains extra information, the <code>e</code> is for the <code>extended</code> version of the <code>ed25519</code> algorithm. The extension is to support stakepool delegation. The <code>sk</code> indicates it's the secret or private key. The <code>1</code> acts as a separator for the actual key. The whole line is needed.
                            </p>
                            <h3>Public Key</h3>
                            <p>
                                Next you need to generate your public key from the secret key by running this command:
                                <pre>$ echo ed25519e_sk1prz97aenm5z0344087hyt2mpr26zrvh0ymcq9lpff3mw47fpwax8pxx24dynwwejm5uhccfr6rtuezcfqfev08urxv8zyls36zwe2psrx9cnm | jcli key to-public</pre>
                                You should see an output similar to the below, after you hit the return key:
                                <pre>$ echo ed25519e_sk1prz97aenm5z0344087hyt2mpr26zrvh0ymcq9lpff3mw47fpwax8pxx24dynwwejm5uhccfr6rtuezcfqfev08urxv8zyls36zwe2psrx9cnm | jcli key to-public
ed25519e_pk1agqvdmh25xtt44ms2a33pt4thr3qcuappv7yzz8cyhj02djnfk3s0a5slc</pre>
                                What you just did was use the unix <code>echo</code> command to "repeat" your secret key into the program via the pipe symbol <code>|</code>. The <code>luceo</code> program then received the input and generated the public key from the secret key. Note the similar but shorter output as the secret key, where the <code>pk</code> indicates it's the public key.
                            </p>
                            <h3>Luceo Address</h3>
                            <p>
                                Lastly, you need to generate your luceo address, copy and paste your public key into this command.
                                <pre>$ jcli address single ed25519e_pk1agqvdmh25xtt44ms2a33pt4thr3qcuappv7yzz8cyhj02djnfk3s0a5slc</pre>
                                Now hit the return key:
                                <pre>$ jcli address single ed25519e_pk1agqvdmh25xtt44ms2a33pt4thr3qcuappv7yzz8cyhj02djnfk3s0a5slc
ceo1q04qp3hwa2sedwkhwptkxy9w4wuwyrrn5y9ncsgglqj7fafk2dx6xuzsgv9</pre>
                                Note the generated luceo address should contain a <code>ceo</code> at the beginning. This indicates a <code>production</code> address to be used on the <code>mainnet</code> after the ICO launches.
                            </p>
                            <p>
                                A quick word on address types and phases. The address you generated is a <code>mainnet</code> address. Which will be included into the luceo genesis block. After we reach the <code>mainnet</code> phase we'll setup an actual <code>testnet</code>. During the ICO phase the <code>ceo</code> address prefix will act as the testnet due to the weekly genesis block regenerations. After the <code>mainnet</code> launch, a new <code>testnet</code> address will be created called <code>teo</code>. <code>ceo</code> is the ticker symbol of the luceo currency and <code>teo</code> implies a testnet.
                            </p>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">4) Securing your cryptographic keys</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                          <p>
                              A quick reminder, you just generated three pieces of information
                              <ol>
                                <li>Private Key or Secret Key</li>
                                <li>Public Key</li>
                                <li>Luceo Address</li>
                              </ol>
                              As one would assume by the names, the Private Key should be kept private and not shared with anybody. This is the source of identity and should be kept in a secure location. Ideally you should print out the three pieces of information, labeled accordingly, onto a piece of paper. Optionally laminate it and place it in a home vault or a bank vault.
                          </p>
                          <p>
                              Keep in mind this information should be kept away from prying eyes, or people that might accidentally come across it, such as domestic helpers. Be aware of events like fires and, in those parts of the world that experience it, earthquakes. If you lose this information you lose access to your luceo.
                          </p>
                          <p>
                              Copy and paste these three pieces of information into a file named <code>luceo-ico-keys.txt</code>. It should look like this:
                              <pre>secret key: ed25519e_sk1prz97aenm5z0344087hyt2mpr26zrvh0ymcq9lpff3mw47fpwax8pxx24dynwwejm5uhccfr6rtuezcfqfev08urxv8zyls36zwe2psrx9cnm
public key: ed25519e_pk1agqvdmh25xtt44ms2a33pt4thr3qcuappv7yzz8cyhj02djnfk3s0a5slc
luceo address: ceo1q04qp3hwa2sedwkhwptkxy9w4wuwyrrn5y9ncsgglqj7fafk2dx6xuzsgv9</pre>
                          </p>
                          <p>
                              We now need to clean up and remove sensitive information. If you execute the command <pre>$ history</pre> you will see the sensitive information you just generated is in the command history.
                          </p>
                          <p>
                              We need to remove this information from your command history. If you use <code>bash</code> then run this command. Note this command will remove your entire command history and close your terminal.
                              <pre>cat /dev/null > ~/.bash_history && history -c && exit</pre>
                              If you don't use <code>bash</code>, you're likely a person who enjoys experimenting with technology and you'll need to find the command history of your particular shell. Please go ahead and clear it.
                          </p>
                          <p>
                              Now, open another shell and install <code>ccrypt</code> with this command:
                              <pre>$ nix-env -iA nixpkgs.ccrypt</pre>
                              Then encrypt your <code>luceo-ico-keys.txt</code> with this command:
                              <pre>$ ccencrypt luceo-ico-keys.txt</pre>
                              Ensure you select a difficult password, write it down and do not lose it. This will ensure your data is stored properly till at least more secure means are used other than this approach of storing your key.
                              To decrypt your file run this command:
                              <pre>$ ccdecrypt luceo-ico-keys.txt.cpt</pre>
                              Note, <code>ccencrypt</code> will replace your file <code>luceo-ico-keys.txt</code> with <code>luceo-ico-key.txt.cpt</code> and <code>ccdecrypt</code> will rename the file back to <code>luceo-ico-keys.txt</code>.
                          </p>
                          <p>
                              To see that the contents are actually encrypted run this command: <pre>$ cat luceo-ico-key.txt.cpt</pre>
                          </p>
                          <p>
                              Some of the more technical users out there might notice this was a rather poor man's way of doing securing keys. You're correct, in the near future a more robust key management solution will be created.
                          </p>
                          <p>
                              Try this process again, ensuring you have the correct Public Key associated with the Secret Key and you haven't mistakenly generated a luceo address that's not derived from the chosen keys. Make sure you're familiar with the process, because the next step means you'll be committing to your chosen keys. Once your luceo address is inserted into the Bitcoin blockchain, there is no way to undo do this.
                          </p>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">5) Inserting the ICO payment which contains your luceo address into the Bitcoin (BTC) blockchain</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                            <h3>Pre-ICO phase</h3>
                            <p>
                                The below ICO phase is for you to get familiar with the process of sending your luceo address in a bitcoin transaction. In the mean time before we actually start the ICO process you may email your testing luceo address to <code>testnet@fra*lide.com</code> and the amount of coin you want. Generate your luceo testing address using this command: <pre>$ jcli address single ed25519e_pk1agqvdmh25xtt44ms2a33pt4thr3qcuappv7yzz8cyhj02djnfk3s0a5slc --testing</pre> will generate a testnet address.
                            </p>
                            <h3>ICO phase</h3>
                            <p>
                                During the ICO phase, it'll be time to set your keys in stone.
                            </p>
                            <p>
                                We need to do two things:
                                <ol>
                                  <li>Send BTC to the Luceo ICO address</li>
                                  <li>Insert your generated Luceo address into the same transaction</li>
                                </ol>
                                Bitcoin has a low level transaction language we'll be able to use for this. The language consists of <code>OP_CODES</code> or operation codes. Executing these <code>OP_CODES</code> tells Bitcoin what to do and in which order. There's one specific <code>OP_CODE</code> that we'll be using: <code>OP_RETURN</code>.
                            </p>
                            <p>
                                Typically <code>OP_RETURN</code> is used to mark a transaction ouput as invalid. Meaning that any output with <code>OP_RETURN</code> in it is unspendable. Though, there's a trick, you can use a <code>OP_RETURN</code> output to send exactly 80 bytes of information. Luckily the luceo address comes in at 63 bytes of information and is usable for us.
                            </p>
                            <p>
                                We'll be creating a transaction with three outputs. One for the Luceo transaction to the ICO address, the second, an <code>OP_RETURN</code> output that contains the luceo address. The software you use should automatically create the third and final output, which is your <code>change</code> output. Meaning the leftover coin is sent back to a different address you control.
                            </p>
                            <p>
                                Different software has different ways of manipulating outputs <code>OP_RETURN</code>, we'll show you one way. You'll need to see if your bitcoin wallet is able to do this. We'll be using the Trezor software. If you're within the cryptocurrency field you should be using a hardware wallet.
                            </p>
                            <p>
                                <code>Note:</code> Luceo addresses that are part of transactions between date X and date Y will only be considered for the inclusion into the luceo genesis block.
                            </p>
                            <p>
                                These are the steps needed to get your luceo address into the bitcoin blockchain. Go ahead and open the <a href="https://wallet.trezor.io">trezor wallet</a> by inserting your Trezor pin. Open one of your accounts, ensuring you're using Bitcoin.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step1.png" />
                            </div>
                            <p>
                                Now click on the <code>Send</code> tab. You should see something similar to the above.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step2.png" />
                            </div>
                            <p>
                                Next go ahead and copy paste the Luceo's Bitcoin ICO address: <code>37B3xA3e4pArk4iiDYzGEpAnVjrtp4L1vF</code> and insert it into the <code>Address</code> input box.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step3.png" />
                            </div>
                            <p>
                                Insert an amount of Bitcoin into the <code>Amount</code> field.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step4.png" />
                            </div>
                            <p>
                                Click on the <code>Add recipient</code> drop down box at the bottom right of the screen.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step5.png" />
                            </div>
                            <p>
                                Then click on <code>Add OP_RETURN</code>. You should see something similar to the above.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step6.png" />
                            </div>
                            <p>
                                Copy paste your generated <code>ceo1q04qp3hwa2sedwkhwptkxy9w4wuwyrrn5y9ncsgglqj7fafk2dx6xuzsgv9</code> address into the <code>Data(text)</code> section ensuring there are no spaces. You will see the <code>Data(hex)</code> section automatically populated with the hexadecimal version of your address. Don't change anything in the <code>Data(hex)</code>. Notice that the fees went up a little after you pasted your address into the <code>Data(text)</code> text box. This is because you are sending a bit more data into the bitcoin network. More data, more money.
                            </p>
                            <p>
                                Finally click on the <code>Send $###</code> button and confirm the transaction on your trezor device.
                            </p>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">6) Querying for your luceo address in the luceo blockchain</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                            <p>
                                If everything went well you should have your luceo address on the bitcoin blockchain. We'll be running a script that'll scrape transactions to that Luceo Bitcoin ICO Address. The script will extract your luceo address and calculate the discount you get based on how early you send a transaction in the ICO period. A new luceo genesis block will be generated which includes your luceo address and will be published to <a href="https://luceo.fractalide.com">https://luceo.fractalide.com</a>.
                            </p>
                            <p>
                                You'll need to wait a week or so before we make the next regeneration. Once ready then issue this command:
                                <pre>$ jcli rest v0 utxo get --host https://luceo.fractalide.com</pre>
                                You should see a long list of all luceo accounts and associated luceo amounts. You might prefer to search a different way if the output gets too large:
                                <pre>$ jcli rest v0 utxo get --host https://luceo.fractalide.com | grep ceo1q04qp3hwa2sedwkhwptkxy9w4wuwyrrn5y9ncsgglqj7fafk2dx6xuzsgv9</pre> You should see an output similar to: <pre>  out_addr: ceo1q04qp3hwa2sedwkhwptkxy9w4wuwyrrn5y9ncsgglqj7fafk2dx6xuzsgv9</pre>
                            </p>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">Welcome to Fractalide</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                            <p>
                                The Fractalide project takes aim at two main targets.
                                <ol>
                                  <li>Decentralised, scalable, privacy preserving, efficient currency</li>
                                  <li>Giving you options to close the door on tech giants and decentralise your online activities</li>
                                </ol>
                            </p>
                            <h3>Decentralised, immutable, permissionless, scalable, privacy preserving and efficient currency</h3>
                            <p>
                                Luceo aims to be a decentralized, immutable, permissionless, scalable, efficient and privacy preserving currency. Its purpose is to provide a unit of exchange for the <a href="/mercat">Mercat Cross</a> app marketplace, allowing you to buy and sell applications that execute on the <code>Xin</code> platform. It also brings together an initial group of people with skin in the game.
                            </p>
                            <h3>Large scale data dissemination capabilities without needing tech giants</h3>
                            <p>
                                <code>Xin</code> is a webassembly execution environment which executes a portable binary format. <code>Wasm</code> applications are decentralised and are obtained via Named Data Networking which is implemented on <code>libp2p</code>. This type of networking immediately makes the need for tech giants who increasingly see it their role to police free speech.
                            </p>
                            <p>
                                Once we bootstrap a thriving community using decentralised applications + money, more grand goals of a privacy preserving identity system can be addressed. We don't want just another useless currency that is purely for speculation, but a currency that can be used to buy applications developed by people looking to pay for their children's school fees and roof over their head.
                            </p>
                        </div>
                    </div>
                    <br>
                    <div class="text-center">
                      <p><img class="" src="/img/comic/sword-min.png" width="317px"/></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/js/ico.js"></script>
