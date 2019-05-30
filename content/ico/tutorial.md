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
                                <a href="http://www.nixos.org/nix">Nix</a> is a high quality, robust, innovative and fast package manager that comes with a large and up to date package collection. It's maintained by a competent group of programmers who take security seriously by running up to date software.
                            </p>
                            <p>
                                We use Nix to distribute all luceo software to users. Prior experience working with distributed ledgers showed it a constant hassle getting exchanges to upgrade software and move miners over to the latest code after a hardfork. Ideally the upgrade process should be as painless as possible for luceo stakepool owners, exchanges, and end users. Using Nix, users only need to install one dependency which will manage the installation and upgrading of luceo thereafter.
                            </p>
                            <p>
                                Sadly, for the moment, this decision will limit windows users, as Nix doesn't run well on windows. Though, latest editions of windows will include the linux kernel which means windows users will be able to use the exact same process as everyone else. You may try installing Nix using the current Windows Subsystem for Linux, though we haven't tested it.
                            </p>
                            <p>
                                Some linux distributions provide a package for the Nix package manager, by all means use it. Otherwise, Nix may be installed via a script on the <a href="https://nixos.org/nix/">Nix website</a>.
                            </p>
                            <p>
                                Once you've installed Nix you need to add the Fractalide channel:
                                <pre>`$ nix-channel --add https://hydra.fractalide.com/project/Ouroboros/channel/latest fractalide`</pre>
                                For the moment we only build for the `Linux(x86_64)` cpu architecture, later we'll add builds for <code>`Linux (i686, aarch64), macOS (x86_64)`</code>.
                            </p>
                            <p>
                                The Luceo channel tracks <a href="https://github.com/NixOS/nixpkgs/tree/release-19.03">nixpkgs 19.03</a>. As the Nix package manager defaults to the development version of nixpkgs, we'll need to switch to the latest stable release:
                                <pre>`$ nix-channel --delete nixpkgs`</pre>
                                then
                                <pre>`$ nix-channel --add https://nixos.org/channels/nixos-19.03 nixpkgs`</pre>
                            </p>
                            <p>
                                Finally effect your changes by the following:
                                <pre>`$ nix-channel --update`</pre>
                            </p>
                            <p>
                                Nix will only install packages with a verified cryptographic signature. Add the Fractalide public key by creating the file `~/.config/nix/nix.conf` with the following contents:
                                <pre>`substituters = https://cache.nixos.org https://hydra.fractalide.com
trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= hydra.fractalide.com-1:EnGZBrRHPabgRET+umo2e+wNrw+c4QdbsxsnV5H7zs0=`</pre>
                            </p>
                            <p>
                                Now go ahead and install `luceo` with this command:
                                <pre>`$ nix-env -iA fractalide.jormungandr-luceo`</pre>
                                The above inserts two commands: `jormungandr-luceo` and `luceo` into your environment.
                            </p>
                            <p>
                                If you came across this error: `file 'fractalide' was not found in the Nix search path` then you've hit this <a href="">nix bug</a>. The workaround is to enter the command below command and try again.
                                <pre>`$ export NIX_PATH=~/.nix-defexpr/channels:$NIX_PATH`</pre>
                            </p>
                            <p>
                                To check if the software is working you may run the `luceo` and `jormungandr-luceo` commands:
                                <pre>`$ luceo --version
jormungandr-luceo 0.0.1`</pre>
                                and try:
                                <pre>`$ jormungandr-luceo --version
jormungandr-luceo 0.0.1`</pre>
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
                                During the ICO period we'll be regenerating the genesis block every week or so. This is to include new ICO contributors so that they too may experiment with the luceo distributed ledger. If you wish to try out `jormungandr-luceo` stakepool software you'll need to make sure you upgrade your luceo software to keep up with the latest genesis block. If you only want to use the `luceo` application then this'll still work with other genesis blocks and thus doesn't need updating so often.
                            </p>
                            <p>
                                Your anonymous luceo address will be on the bitcoin blockchain permanently (using a memory efficient mechanism) and will be part of every luceo genesis block regeneration. Regeneration of the luceo genesis block will stop at the end of the ICO period. Maybe a small window will be needed between the end of the ICO period and `mainnet` to iron out any issues that might arise. Thus the ICO period acts as a `testnet` period, then we'll launch into `mainnet` at the end of the ICO period.
                            </p>
                            <p>
                                When the luceo genesis block is regenerated your luceo amount will be reset to the original amount. This allows you to experiment with luceo by sending coin to other accounts on the ledger. If you decide to purchase another batch of luceo during a later tranche then this'll be added to the original amount. Though once we shift into `mainnet` at the end of the ICO period, your coin won't be reset.
                            </p>
                            <p>
                                Run the below command to retrieve information about the latest versions of luceo and luceo genesis block.
                                <pre>`$ nix-channel --update`</pre>
                                Now reinstall `luceo` with this command:
                                <pre>`$ nix-env -iA fractalide.jormungandr-luceo`</pre>
                            </p>
                            <p>
                                For the moment luceo only supports a "blockchain-in-a-box" and isn't decentralised. Over the ICO period this will change allowing you to setup stakepools. At that point please do submit your stakepool certificate, allowing us to include your pool in the next genesis block regeneration. We'll then list your stakepool so others can see it and experiment with it. Thus when we launch `mainnet` we'll have a sufficiently large user base with enough decentralisation in the form of people running luceo stakepools.
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
                                Now you understand how to get `luceo` working, let's use it to generate your keys and address. You are about to generate three pieces of cryptographic information:
                                <ol>
                                  <li>Private Key or Secret Key</li>
                                  <li>Public Key</li>
                                  <li>Luceo Address</li>
                                </ol>
                            </p>
                            <p>
                                Let's start with creating your secret key. Keep in mind, the example data is not your keys and will be different to the below.
                                Run this command:
                                <pre>`$ luceo key generate --type ed25519Extended`</pre>
                                You should see an output similar to this:
                                <pre>`$ luceo key generate --type ed25519Extended
ed25519e_sk1prz97aenm5z0344087hyt2mpr26zrvh0ymcq9lpff3mw47fpwax8pxx24dynwwejm5uhccfr6rtuezcfqfev08urxv8zyls36zwe2psrx9cnm`</pre>
                                The output is the secret key, a bit of explanation might be needed.
                                The initial `ed25519` indicates it's the digital signature scheme named Edwards-curve Digital Signature Algorithm. The `e` at the end of `ed25519e` indicates that it contains extra information, the `e` is for the `extended` version of the `ed25519` algorithm. The extension is to support stakepool delegation. The `_sk` indicates it's the secret or private key. The `1` acts as a separator for the actual key. The whole line is needed.
                            </p>
                            <p>
                                Next you need to generate your public key from the secret key by running this command:
                                <pre>`$ echo ed25519e_sk1prz97aenm5z0344087hyt2mpr26zrvh0ymcq9lpff3mw47fpwax8pxx24dynwwejm5uhccfr6rtuezcfqfev08urxv8zyls36zwe2psrx9cnm | luceo key to-public`</pre>
                                You should see an output similar to the below, after you hit the return key:
                                <pre>`$ echo ed25519e_sk1prz97aenm5z0344087hyt2mpr26zrvh0ymcq9lpff3mw47fpwax8pxx24dynwwejm5uhccfr6rtuezcfqfev08urxv8zyls36zwe2psrx9cnm | luceo key to-public
ed25519e_pk1agqvdmh25xtt44ms2a33pt4thr3qcuappv7yzz8cyhj02djnfk3s0a5slc`</pre>
                                What you just did was use the unix `echo` command to "repeat" your secret key into the program via the pipe symbol `|`. The `luceo` program then received the input and generated the public key from the secret key. Note the similar but shorter output as the secret key, where the `_pk` indicates it's the public key.
                            </p>
                            <p>
                                Lastly, you need to generate your luceo address, copy and paste your public key into this command.
                                <pre>`$ luceo address single ed25519e_pk1agqvdmh25xtt44ms2a33pt4thr3qcuappv7yzz8cyhj02djnfk3s0a5slc`</pre>
                                Now hit the return key:
                                <pre>`$ luceo address single ed25519e_pk1agqvdmh25xtt44ms2a33pt4thr3qcuappv7yzz8cyhj02djnfk3s0a5slc
ceo1q04qp3hwa2sedwkhwptkxy9w4wuwyrrn5y9ncsgglqj7fafk2dx6xuzsgv9`</pre>
                                Note the generated luceo address should contain a `ceo` at the beginning. This indicates a `production` address to be used on the `mainnet` after the ICO launches.
                            </p>
                            <p>
                                A quick word on address types and phases. The address you generated is a `mainnet` address. Which will be included into the luceo genesis block. After we reach the `mainnet` phase we'll setup an actual `testnet`. During the ICO phase the `ceo` address prefix will act as the testnet due to the weekly genesis block regenerations. After the `mainnet` launch, a new `testnet` address will be created called `teo`. `ceo` is the ticker symbol of the luceo currency and `teo` implies a testnet.
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
                              Copy and paste these three pieces of information into a file named `luceo-ico-keys.txt`. It should look like this:
                              <pre>`secret key: ed25519e_sk1prz97aenm5z0344087hyt2mpr26zrvh0ymcq9lpff3mw47fpwax8pxx24dynwwejm5uhccfr6rtuezcfqfev08urxv8zyls36zwe2psrx9cnm
public key: ed25519e_pk1agqvdmh25xtt44ms2a33pt4thr3qcuappv7yzz8cyhj02djnfk3s0a5slc
luceo address: ceo1q04qp3hwa2sedwkhwptkxy9w4wuwyrrn5y9ncsgglqj7fafk2dx6xuzsgv9`</pre>
                          </p>
                          <p>
                              We now need to clean up and remove sensitive information. If you execute the command <pre>`$ history`</pre> you will see the sensitive information you just generated is in the command history.
                          </p>
                          <p>
                              We need to remove this information from your command history. If you use `bash` then run this command. Note this command will remove your entire command history and close your terminal.
                              <pre>`cat /dev/null > ~/.bash_history && history -c && exit`</pre>
                              If you don't use `bash`, you're likely a person who enjoys experimenting with technology and you'll need to find the command history of your particular shell. Please go ahead and clear it.
                          </p>
                          <p>
                              Now, open another shell and install `ccrypt` with this command:
                              <pre>`$ nix-env -iA nixpkgs.ccrypt`</pre>
                              Then encrypt your `luceo-ico-keys.txt` with this command:
                              <pre>`$ ccencrypt luceo-ico-keys.txt`</pre>
                              Ensure you select a difficult password, write it down and do not lose it. This will ensure your data is stored properly till at least more secure means are used other than this approach of storing your key.
                              To decrypt your file run this command:
                              <pre>`$ ccdecrypt luceo-ico-keys.txt.cpt`</pre>
                              Note, `ccencrypt` will replace your file `luceo-ico-keys.txt` with `luceo-ico-key.txt.cpt` and `ccdecrypt` will rename the file back to `luceo-ico-keys.txt`.
                          </p>
                          <p>
                              To see that the contents are actually encrypted run this command: <pre>`$ cat luceo-ico-key.txt.cpt`</pre>
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
                            <p>
                                It's time your keys are set in stone.
                            </p>
                            <p>
                                We need to do two things:
                                <ol>
                                  <li>Send BTC to the Luceo ICO address</li>
                                  <li>Insert your generated Luceo address into the same transaction</li>
                                </ol>
                                Bitcoin has a low level transaction language we'll be able to use for this. The language consists of `OP_CODES` or operation codes. Executing these `OP_CODES` tells Bitcoin what to do and in which order. There's one specific `OP_CODE` that we'll be using: `OP_RETURN`.
                            </p>
                            <p>
                                Typically `OP_RETURN` is used to mark a transaction ouput as invalid. Meaning that any output with `OP_RETURN` in it is unspendable. Though, there's a trick, you can use a `OP_RETURN` output to send exactly 80 bytes of information. Luckily the luceo address comes in at 63 bytes of information and is usable for us.
                            </p>
                            <p>
                                We'll be creating a transaction with three outputs. One for the Luceo transaction to the ICO address, the second, an `OP_RETURN` output that contains the luceo address. The software you use should automatically create the third and final output, which is your `change` output. Meaning the leftover coin is sent back to a different address you control.
                            </p>
                            <p>
                                Different software has different ways of manipulating outputs `OP_RETURN`, we'll show you one way. You'll need to see if your bitcoin wallet is able to do this. We'll be using the Trezor software. If you're within the cryptocurrency field you should be using a hardware wallet.
                            </p>
                            <p>
                                `Note:` Luceo addresses that are part of transactions between date X and date Y will only be considered for the inclusion into the luceo genesis block.
                            </p>
                            <p>
                                These are the steps needed to get your luceo address into the bitcoin blockchain. Go ahead and open the <a href="https://wallet.trezor.io">trezor wallet</a> by inserting your Trezor pin. Open one of your accounts, ensuring you're using Bitcoin.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step1.png" />
                            </div>
                            <p>
                                Now click on the `Send` tab. You should see something similar to the above.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step2.png" />
                            </div>
                            <p>
                                Next go ahead and copy paste the Luceo's Bitcoin ICO address: `37B3xA3e4pArk4iiDYzGEpAnVjrtp4L1vF` and insert it into the `Address` input box.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step3.png" />
                            </div>
                            <p>
                                Insert an amount of Bitcoin into the `Amount` field.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step4.png" />
                            </div>
                            <p>
                                Click on the `Add recipient` drop down box at the bottom right of the screen.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step5.png" />
                            </div>
                            <p>
                                Then click on `Add OP_RETURN`. You should see something similar to the above.
                            </p>
                            <div class="trezor_steps">
                                <img class="trezor" src="/img/ico-tutorial/step6.png" />
                            </div>
                            <p>
                                Copy paste your generated `ceo1<your-address>` address into the `Data(text)` section ensuring there are no spaces. You will see the `Data(hex)` section automatically populated with the hexadecimal version of your address. Don't change anything in the `Data(hex)`. Notice that the fees went up a little after you pasted your address into the `Data(text)` text box. This is because you are sending a bit more data into the bitcoin network. More data, more money.
                            </p>
                            <p>
                                Finally click on the `Send $###` button and confirm the transaction on your trezor device.
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
                                <pre>`$ luceo rest v0 utxo get --host https://luceo.fractalide.com`</pre>
                                You should see a long list of all luceo accounts and associated luceo amounts. You might prefer to search a different way if the output gets too large:
                                <pre>`$ luceo rest v0 utxo get--host https://luceo.fractalide.com | grep ceo1<your-address>`</pre> You should see your address there.
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
                                By leveraging the latest in peer review future internet technologies (Named Data Networking or NDN) we're giving people the same data dissemination capabilities as tech monopolies, but at negligible cost. Meaning a child on the edge of the internet can, without using tech giants like AWS, Google, Facebook, disseminate their application to millions of people around the world at negligible cost to them.
                            </p>
                            <p>
                                A currency, such as Luceo, associated with a new browser for an information-centric network will be able to compete with a Facebook or Amazon coin and their data dissemination infrastructure.
                            </p>
                            <p>
                                Just as the HTTP browser assisted the TCP/IP network to blossom to what it is today. So, a new NDN browser aims to achieve a similar effect. The Fractalide project isn't just a new cryptocoin, but it's a new implementation of Named Data Networking, a new browser designed for the NDN protocol, and importantly, an app store allowing a market for users to trade luceo for applications that are designed to run on a browser meant for an NDN.
                            </p>
                            <p>
                                The money you send to purchase luceo will be used to build out this infrastructure only.
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
