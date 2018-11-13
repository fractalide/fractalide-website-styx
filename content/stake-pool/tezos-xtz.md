<div class="row">
    <div class="col-lg-offset-3 col-lg-6 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
        <div class="text-center">
            <h2 class="sub_heading_blue">A Tezos Stake Pool has an important role in securing the XTZ cryptocurrency</h2>
            <p>
                We return 85% of our baking rewards to you. The other 15% supports the building of a new browser for a future internet which requires fast moving efficient cryptocurrencies to facilitate transactions in the community.
            </p>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10 text-center">
        <div class="blue_box">
            <h2 class="sub_heading_blue">Delegation address</h2>
            <div class="row white_box">
                <div class="col-lg-8 col-xs-offset-1 col-xs-10">
                    <span id="delegationAddress">{{ address }}<span>
                </div>
                <div class="col-lg-4 col-xs-offset-1 col-xs-10">
                    <a class="copy" href="#" onclick="javascript:copyToClipboard('delegationAddress',event);">
                        <img src="/img/stake-pools/copy.png" width="19px">
                        Copy
                    </a>
                </div>
            </div>
            <div class="row full_box hidden">
                <div class="">
                    We're full!
                </div>
            </div>
        </div>
        <table>
        <tr><th>cycle</th><th>staker</th><th>balance<br>(at the snapshot of this cycle)</th><th>rewards<br>(returned in this cycle)</th></tr>
        {{
          let
            renderRow = row: ''
            <tr><td>${toString row.cycle}</td><td>${row.staker}</td>
                <td>${if row ? balance then row.balance else "0"}</td>
                <td>${if row ? rewards then row.rewards else "0"}</td></tr>
            '';
          in
            lib.concatMapStringsSep "\n" renderRow
              (lib.sortBy "staker" "asc" (lib.sortBy "cycle" "asc" data))
        }}
        </table>
    </div>
</div>

<script src="/js/global.js"></script>
