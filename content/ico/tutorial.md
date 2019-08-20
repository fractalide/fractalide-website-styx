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
                                This tutorial will guide you through the process of getting your luceo address into the luceo mainnet genesis block. It's designed so that we never interact with your secret/private keys, making the process more secure.
                            </p>
                            <p>
                              There are 3 steps in the process:
                            </p>
                            <ol>
                              <li>Obtaining your Luceo keys and address</li>
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
                    <h2 class="sub_heading_blue">1) Obtaining your Luceo keys and address</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                            <h3>Required ICO information</h3>
                            <p>
                                To participate in the ICO process you need two pieces of information:
                                <ol>
                                  <li>Secret + Public Key</li>
                                  <li>Luceo address</li>
                                </ol>
                            </p>
                            <p>
                                Jolt is the early stages of a Luceo wallet that'll be the canonical wallet for the platform. Currently it only supports the generation of your secret key and public key.
                                Navigate to <a href="https://puff.fractalide.org/jolt">Jolt</a> and enter a passphrase. It's critical that you read and understand the comic which will teach you why a passphrase is important. Write down you passphrase on a piece of paper and store it in a secure place.
                            </p>
                            <h3>Download keys</h3>
                            <p>
                                Once you input your passphrase you will see a link called <code>Jolt keypair download</code>. Ensure you click it. This'll download the keypair. The file contents are encrypted using your passphrase. Please store this file in a secure location. A suitable place is possibly on multiple USB sticks or back up hard disks.
                            </p>
                            <h3>Copy your Luceo production address</h3>
                            <p>
                                On the same page you will see <code>Your Luceo production address is:</code>. Ensure you copy this address and as you will need it in the next section when you participate in the ICO.
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
                    <h2 class="sub_heading_blue">2) Inserting the ICO payment which contains your luceo address into the Bitcoin (BTC) blockchain</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                            <h3>ICO Participation</h3>
                            <p>
                                This section will teach you how to participate in the Luceo ICO.
                            </p>
                            <p>
                                We need to do two things:
                                <ol>
                                  <li>Send your Bitcoin to the Luceo ICO Bitcoin address</li>
                                  <li>Insert your above generated Luceo address into the same transaction</li>
                                </ol>
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
                    <h2 class="sub_heading_blue">3) Querying for your luceo address in the luceo blockchain</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-10 col-xs-12 light_blue_box">
                            <p>
                                If everything went well you should have your luceo address on the bitcoin blockchain. We'll be running a script that'll scrape transactions to that Luceo Bitcoin ICO Address. The script will extract your luceo address and calculate the discount you get based on how early you send a transaction in the ICO period. A new luceo genesis block will be generated which includes your luceo address and will be published to <a href="https://luceo-testnet-rest.fractalide.org/api">https://luceo-testnet-rest.fractalide.org/api</a>.
                            </p>
                            <p>
                                You'll need to wait a week or so before we make the next regeneration. Once ready install <code>jcli</code> from <a href="https://github.com/fractalide/jormungandr">here</a> then issue this command:
                                <pre>$ jcli rest v0 utxo get --host https://luceo-testnet-rest.fractalide.org/api/</pre>
                                You should see a long list of all luceo accounts and associated luceo amounts. You might prefer to search a different way if the output gets too large:
                                <pre>$ jcli rest v0 utxo get --host https://luceo-testnet-rest.fractalide.org/api/ | grep ceo1q04qp3hwa2sedwkhwptkxy9w4wuwyrrn5y9ncsgglqj7fafk2dx6xuzsgv9</pre> You should see an output similar to: <pre>  out_addr: ceo1q04qp3hwa2sedwkhwptkxy9w4wuwyrrn5y9ncsgglqj7fafk2dx6xuzsgv9</pre>
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
                                Fractalide is a privacy preserving project for communications and financial transactions.
                            </p>
                            <p>
                                <code>Luceo</code> aims to be a decentralized, immutable, permissionless, scalable, efficient and privacy preserving currency. It's purpose is to provide a safe haven for people living under authoritarian governments. ICO funds will be used to implement a privacy preserving communications platform called <code>Puff</code>.
                            </p>
                            <p>
                                <code>Puff</code> will be an application that implements a new networking layer that makes it easier to implement strong security, anonymity and reduces the cost of data dissemination.
                            </p>
                            <p>
                                We thank you for your contribution. Further details can be read in our technical whitepaper.
                            </p>
                        </div>
                    </div>
                    <br>
                    <div class="text-center">
                      <p><img class="sword" src="/img/comic/sword-min.png"/></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="/js/ico.js"></script>
