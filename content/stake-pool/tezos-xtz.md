<div class="row">
    <div class="col-lg-offset-3 col-lg-6 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10 text-center">
        <h2 class="sub_heading_blue">A Tezos Stake Pool has an important role in securing the XTZ cryptocurrency</h2>
    </div>
</div>
<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10 text-center">
        <div class="blue_box">
            <h2 class="sub_heading_blue">Delegation address</h2>
            <div class="row white_box">
                <div class="col-lg-8 col-xs-offset-2 col-xs-10">
                    <a href="https://tzscan.io/{{ address }}?default=delegation"
                       <span id="delegationAddress">{{ address }}</span>
                    </a>
                    <a class="copy" href="#" onclick="javascript:copyToClipboard('delegationAddress',event);">
                        <img src="/img/stake-pools/copy.png" width="19px">
                    </a>
                </div>
            </div>
            <div class="row full_box hidden">
                <div class="">
                    We're full!
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10 text-center">
        <p class="text_dark_blue">
            We return 85% of our baking rewards to you. The other 15% supports the building of a new browser for a future internet which requires fast moving efficient cryptocurrencies to facilitate transactions in the community.
        </p>
        <p class="text_dark_blue">
            <b class="text_dark_blue">Enter your public key to see how your XTZs baking progress:</b>
        </p>
    </div>
</div>
<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10 text-center">
        <div class="blue_box">
            <h2 class="sub_heading_blue">Your address</h2>
            <input class="form-control" id="yourAddress" name="yourAddress" placeholder="KT1..."/>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10 text-center">
        <div class="blue_box">
            <h2 class="sub_heading_blue">Estimate Your Annual Rewards</h2>
            <div class="row">
                <div class="col-xs-2">
                    Your Stake
                    <div class="input-group">
                        <input type="text" class="form-control" aria-describedby="your-stake-addon">
                        <span class="input-group-addon" id="your-stake-addon"><img src="/img/stake-pools/tezos-currency-white-min.png" width="12px"/></span>
                    </div>
                </div>
                <div class="col-xs-2">
                    Estimated Blocks Per Year
                </div>
                <div class="col-xs-2">
                    Baker Rewards Per Block
                </div>
                <div class="col-xs-2">
                    Average Fees Per Block
                    <div class="input-group">
                        <input type="text" class="form-control" aria-describedby="your-stake-addon">
                        <span class="input-group-addon" id="your-stake-addon"><img src="/img/stake-pools/tezos-currency-white-min.png" width="12px"/></span>
                    </div>
                </div>
                <div class="col-xs-2">
                    Endorsement Rewards Per Block
                </div>
                <div class="col-xs-2">
                    Endorsement Per Block
                </div>
                <div class="col-xs-2">
                    Total Tezos Supply
                </div>
                <div class="col-xs-2">
                    Percentage of Tez that Stake
                    <div class="input-group">
                        <input type="text" class="form-control" aria-describedby="your-stake-addon">
                        <span class="input-group-addon" id="your-stake-addon"><b class="text_white">%</b></span>
                    </div>
                </div>
                <div class="col-xs-2">
                    Fractalide XTZ Stake Pool Reward-Share
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-offset-2 col-sm-4 col-xs-offset-1 col-xs-5 text-center">
        <div class="border_blue">
            <p class="text_dark_blue">Your Estimated Fractalide XTZ Stake Pool Rewards</p>
            <h2 class="sub_heading_blue">87.58 <img src="/img/stake-pools/tezos-currency-blue-min.png" width="18px"/></h2>
        </div>
    </div>
    <div class="col-sm-4 col-xs-5 text-center">
        <div class="border_blue">
            <p class="text_dark_blue">Your Estimated Fractalide XTZ Stake Pool Delegation Annual Reward Percentage</p>
            <h2 class="sub_heading_blue">8.8 %</h2>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
        <div class="text-center">
            <h2 class="sub_heading_blue">Earnings Calculation</h2>
            <img class="tezos_icon" src="/img/stake-pools/icon-calculation-min.png" width="85px">
        </div>
        <span class="text_dark_blue">
            Your earnings are based on a few factors which include:
        </span>
        <ul class="text_dark_blue">
            <li>Amount of XTZ delegated to Fractalide XTZ Stake Pool.</li>
            <li>Amount of XTZ held in bonding.</li>
            <li>Total XTZ staked by every XTZ holder globally.</li>
            <li>Bake and endorse selection rates.</li>
            <li>Random valued transaction fees in the blocks we bake.</li>
            <li>When you start and stop delegating with us during a baking cycle.</li>
            <li>Required gas needed to send your reward back to you.</li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10 text-center">
        <h2 class="sub_heading_blue">Estimates & Projections</h2>
        <img class="tezos_icon" src="/img/stake-pools/icon-projection-min.png" width="85px">
        <p class="text_dark_blue">
            We've tried our best efforts to given the data available to arrive at the current earnings. Baking rights, earnings, fees and the actual network are very unpredictable as such we're currently not working out earning projections. This may change in future.
        </p>
        <p class="text_dark_blue">
            The source code for the stake pool is free and open source under the MPLv2 license. We encourage contributions should you find any issue with the code. Indeed we go further and hope you use our software to setup your own stake pool should you be technically inclined.
        </p>
        <p class="text_dark_blue">
            Should the Fractalide XTZ Stake Pool become over delegated, meaning we don't have enough bond to cover the baking fees for all baking rights delegated to us, we'll only pay out baking fees on a first-come, first-served basis. We reserve the right to change this approach at any time.
        </p>
        <p class="text_dark_blue">
            We reserve the right to change any term of this delegation service at any time and are not obligated to inform you of any change.
        </p>
    </div>
</div>
<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
        <div class="text-center">
            <h2 class="sub_heading_blue">Community Impact</h2>
            <img class="tezos_icon" src="/img/stake-pools/icon-community-min.png" width="85px">
        </div>
        <span class="text_dark_blue">
            Pool earnings will be used to:
        </span>
        <ul class="text_dark_blue">
            <li>Develop the Fractalide browser a future open source Internet browser.</li>
            <li>Develop and maintain open source stakepool software used for multiple different Proof of Stake blockchains.</li>
            <li>Develop the networking infrastructure used for the Fractalide browser.</li>
            <li>Infrastructure for running the Fractalide XTZ Stake Pool delegation service.</li>
        </ul>
        <span class="text_dark_blue">
            @fractalide twitter
        </span>
    </div>
</div>

<script src="/js/global.js"></script>
