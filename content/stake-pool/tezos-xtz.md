<div class="row">
    <div class="col-lg-offset-3 col-lg-6 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
        <div class="text-center">
            <h2 class="sub_heading_blue">Fractalide XTZ Stakepool</h2>
            <p>
                Our stakepool is now live and you're welcome to put your tezzies to work by delegating them to our below address.
            </p>
            <p>
                We return 85% the rewards to our delegators in the same cycle they are released. All our pool software is <a href="https://github.com/fractalide/fractalpools">open source</a> and we operate is a high security environment. Pool earnings are used to help fund the development of an open source browser for a future internet. Just as cryptocurrencies allow for a bank in your back pocket, so Fractalide aims to give you data dissemination capabilities of Internet monopolies at pennies on the dollar.
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

<script src="/js/global.js"></script>
