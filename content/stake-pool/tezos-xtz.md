<div class="row">
    <div class="col-lg-offset-3 col-lg-6 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
        <div class="text-center">
            <h2 class="sub_heading_blue">Fractalide XTZ Stakepool</h2>
            <p>
                Our stakepool is now live and you're welcome to put your tezzies to work by delegating them to our below address.
            </p>
            <p>
                We return 93% the rewards to our delegators in the same cycle they are released. All our pool software is <a href="https://github.com/fractalide/fractalpools">open source</a> and we operate is a high security environment. Pool earnings are used to help fund the development of <a href="/trulity">Trulity</a>, an open source browser for a future internet. Just as cryptocurrencies allow for a bank in your back pocket, so Fractalide aims to give you data dissemination capabilities of Internet monopolies at negligible cost.
            </p>
        </div>
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
            <input type="text" class="form-control input-lg" id="yourAddress" name="yourAddress" placeholder="KT1..."/>
        </div>
    </div>
</div>

<div id="estimation">

<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10 text-center">
        <div class="blue_box">
            <h2 class="sub_heading_blue">Estimate Your Annual Rewards</h2>
            <div class="math_formula">
                <div class="math_element">
                    <div class="math_name">
                        <b class="text_dark_blue"><br>Your Stake</b>
                    </div>
                    <div class="math_field">
                        <div class="input-group">
                            <input type="text" class="form-control" aria-describedby="your-stake-addon" id="yourStake" value="1000">
                            <span class="input-group-addon darker" id="your-stake-addon"><img src="/img/stake-pools/tezos-currency-white-min.png" width="12px"/></span>
                        </div>
                    </div>
                </div>
                <div class="math_symbol math_symbol_times">
                    <span></span>
                </div>
                <div class="math_element">
                    <div class="math_name">
                        <b class="text_dark_blue">Estimated<br>Blocks Per Year</b>
                    </div>
                    <div class="math_value">
                        <span id="estiamatedBlocksPerYear" data-val="491520">491.520</span>
                    </div>
                </div>
                <div class="math_symbol math_symbol_times">
                    <span></span>
                </div>
                <div class="math_symbol math_symbol_parenthesis_open">
                    <span></span>
                </div>
                <div class="math_element">
                    <div class="math_name">
                        <b class="text_dark_blue">Baker Rewards<br>Per Block</b>
                    </div>
                    <div class="math_value">
                        <span id="bakerRewardsPerBlock">16</span>
                    </div>
                </div>
                <div class="math_symbol math_symbol_plus">
                    <span></span>
                </div>
                <div class="math_element">
                    <div class="math_name">
                        <b class="text_dark_blue">Average Fees<br>Per Block</b>
                    </div>
                    <div class="math_field">
                        <div class="input-group">
                            <input type="text" class="form-control" aria-describedby="avg-fees-per-block-addon" id="averageFeesPerBlock" value="0">
                            <span class="input-group-addon darker" id="avg-fees-per-block-addon"><img src="/img/stake-pools/tezos-currency-white-min.png" width="12px"/></span>
                        </div>
                    </div>
                </div>
                <div class="math_symbol math_symbol_plus">
                    <span></span>
                </div>
                <div class="math_element">
                    <div class="math_name">
                        <b class="text_dark_blue">Endorsement<br>Rewards Per Block</b>
                    </div>
                    <div class="math_value">
                        <span id="endorsementRewardsPerBlock">2</span>
                    </div>
                </div>
                <div class="math_symbol math_symbol_times">
                    <span></span>
                </div>
                <div class="math_element">
                    <div class="math_name">
                        <b class="text_dark_blue">Endorsement<br>Per Block</b>
                    </div>
                    <div class="math_value">
                        <span id="endorsementPerBlock">32</span>
                    </div>
                </div>
                <div class="math_symbol math_symbol_parenthesis_close">
                    <span></span>
                </div>
                <div class="math_symbol math_symbol_divide">
                    <span></span>
                </div>
                <div class="math_element">
                    <div class="math_name">
                        <b class="text_dark_blue">Total Tezos<br>Supply</b>
                    </div>
                    <div class="math_value">
                        <span id="totalTezosSupply" data-val="763300000">763.3M</span>
                    </div>
                </div>
                <div class="math_symbol math_symbol_divide">
                    <span></span>
                </div>
                <div class="math_element">
                    <div class="math_name">
                        <b class="text_dark_blue">Percentage of<br>Tez that Stake</b>
                    </div>
                    <div class="math_field">
                        <div class="input-group">
                            <input type="text" class="form-control" aria-describedby="percentage-stake-addon" id="percentageOfTezThatStake" value="50">
                            <span class="input-group-addon darker" id="percentage-stake-addon"><b class="text_white">%</b></span>
                        </div>
                    </div>
                </div>
                <div class="math_symbol math_symbol_times">
                    <span></span>
                </div>
                <div class="math_element">
                    <div class="math_name">
                        <b class="text_dark_blue">Fractalide XTZ Stake<br>Pool Reward-Share</b>
                    </div>
                    <div class="math_value">
                        <span id="fractalideXTZStakePoolRewardShare" data-val="0.85">85%</span>
                    </div>
                </div>
                <div class="math_symbol math_symbol_equal">
                    <span></span>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row row-eq-height">
    <div class="col-sm-offset-2 col-sm-4 col-xs-offset-1 col-xs-10 text-center">
        <div class="border_blue">
            <p class="text_dark_blue">Your Estimated Fractalide XTZ Stake Pool Rewards</p>
            <h2 class="sub_heading_blue"><span id="yourEstimated">87.58</span> <img src="/img/stake-pools/tezos-currency-blue-min.png" width="18px"/></h2>
        </div>
    </div>
    <div class="col-sm-offset-0 col-sm-4 col-xs-offset-1 col-xs-10 text-center">
        <div class="border_blue">
            <p class="text_dark_blue">Your Estimated Fractalide XTZ Stake Pool Delegation Annual Reward Percentage</p>
            <h2 class="sub_heading_blue"><span id="yourEstimatedPercentage">8.8</span> %</h2>
        </div>
    </div>
</div>

</div>

<!-- kt1 data table -->
<div id="kt1" style="display: none;">

<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10 text-center">
        <div class="border_blue">
            <h2 class="sub_heading_blue">You're delegating!</h2>
            <p class="text_dark_blue">
                You delegated by Cycle 26
            </p>
            <p class="text_dark_blue">
                All rewards re-delegate and you are supporting Fractalide XTZ Stake Pool
            </p>
            <h2 class="sub_heading_blue">91.75 <img src="/img/stake-pools/tezos-currency-blue-min.png" width="18px"/></h2>
            <h2 class="sub_heading_blue">Staked & Delegated</h2>
        </div>
    </div>
</div>

<div class="row row-eq-height">
    <div class="col-sm-offset-2 col-sm-4 col-xs-offset-1 col-xs-10 text-center">
        <div class="blue_box">
            <p><b class="text_dark_blue">Last Cycle Paid</b></p>
            <h2 class="sub_heading_blue">40</h2>
        </div>
    </div>
    <div class="col-sm-offset-0 col-sm-4 col-xs-offset-1 col-xs-10 text-center">
        <div class="blue_box">
            <p><b class="text_dark_blue">All-time Rewards Paid</b></p>
            <h2 class="sub_heading_blue">17368.671477</h2>
        </div>
    </div>
</div>

<div class="row kt1_data">
    <div class="col-sm-offset-2 col-sm-8">
        <div class="table-responsive">
            <table class="table table-padded">
                <thead>
                    <tr>
                        <th>Cycle</th>
                        <th>Snapshot Balance</th>
                        <th>Estimated Rewards</th>
                        <th>Final Rewards</th>
                        <th>Payout Hash</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>

</div>

<div class="row">
    <div class="col-sm-offset-3 col-sm-6 col-xs-offset-1 col-xs-10">
        <div class="text-center top_margin">
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
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10 text-center top_margin">
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
    <div class="col-sm-offset-3 col-sm-6 col-xs-offset-1 col-xs-10">
        <div class="text-center top_margin">
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
<script src="/js/tezos.js"></script>