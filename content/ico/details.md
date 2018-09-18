<div class="container">
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">Token Details</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-1 col-md-5 col-xs-12">
                            <p>
                                <b>Currency name:</b> LUCEO
                            </p>
                            <p>
                                <b>Currency ticker symbol:</b> CEO
                            </p>
                            <p>
                                <b>Currency type:</b> Utility coin used in Fractalide marketplace (Fractalmarket).
                            </p>
                            <p>
                                <b>Total supply:</b> 45 Billion CEO
                            </p>
                            <p>
                                <b>Amount for sale:</b> 850 Million CEO
                            </p>
                            <p>
                                <b>Sales target:</b> USD $20 Million
                            </p>
                            <p>
                                <b>Private sale duration:</b> 41 epochs (~6.5 months)
                            </p>
                        </div>
                        <div class="col-md-5 col-xs-12 light_blue_box">
                            <p>
                                <b>Price:</b> Starting at 75% discount at first epoch to 0% discount at last epoch 1 ADA buys 1 LUCEO.
                            </p>
                            <p>
                                $$p = x \cdot 0.01 \cdot 100 - d + {e \over (n - 1)} \cdot d$$
                            </p>
                            <p>
                                <b>x</b> = exchange rate of 1 ADA in final epoch
                                <br/>
                                <b>d</b> = initial discount of 75%
                                <br/>
                                <b>n</b> = 41 epochs to complete presale
                                <br/>
                                <b>e</b> = epoch to query for ADA price (p)
                                <br/>
                                <b>p</b> = ADA price at queried epoch (e)
                            </p>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-offset-3 col-md-6 col-xs-offset-1 col-xs-10">
                            <a class="btn btn-lg btn-default btn-block" href="#">Download whitepaper</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">If you wish to participate in the ICO please agree to these points and solve a small mathematical problem.</h2>
                </div>
                <div class="panel-body checklist">
                    <div class="row">
                        <div class="col-md-1 col-xs-2 text-right">
                            <label>
                                <input type="checkbox" />
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-11 col-xs-10">
                            <p>
                                I agree Fractalide won't issue a presale private key to me and that my ADA private key will be the private key on the new LUCEO network when it's launched.
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1 col-xs-2 text-right">
                            <label>
                                <input type="checkbox" />
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-11 col-xs-10">
                            <p>
                                I agree that if I delete the ADA private key used to participate in the LUCEO presale I will not be able to claim my LUCEO coin.
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1 col-xs-2 text-right">
                            <label>
                                <input type="checkbox" />
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-11 col-xs-10">
                            <p>
                                I agree that my ADA public address will be included in the new LUCEO genesis block only if a transaction from my ADA address to the ADA presale address is found on the ADA blockchain during specific epochs.
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1 col-xs-2 text-right">
                            <label>
                                <input type="checkbox" />
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-11 col-xs-10">
                            <p>
                                I agree that I will need to import my ADA private key to access my LUCEO coin when the LUCEO mainnet is launched (Q1~Q2 2019).
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1 col-xs-2 text-right">
                            <label>
                                <input type="checkbox" />
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-11 col-xs-10">
                            <p>
                                I agree NOT to send ADA from an exchange or any other firm, because I do not control that ADA private key as that firm holds my ADA on my behalf. The exchange/firm will then be credited with my LUCEO and I will never be able to claim my LUCEO in this
                                case.
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1 col-xs-2 text-right">
                            <label>
                                <input type="checkbox" />
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-11 col-xs-10">
                            <p>
                                I agree I will only send ADA from an account I own and control the private key to.
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1 col-xs-2 text-right">
                            <label>
                                <input type="checkbox" />
                                <span></span>
                            </label>
                        </div>
                        <div class="col-md-11 col-xs-10">
                            <p>
                                I understand there is no KYC/AML requirement in this presale.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="panel-body text-center">
                    <form class="form-horizontal light_blue_box">
                        <h2 class="sub_heading_blue">What is the ADA price (p) of 1 LUCEO at epoch <span id="epoch"></span> (e)?</h2>
                        <div class="form-group form-group-lg">
                            <div class="col-md-offset-2 col-md-8 col-xs-12">
                                <input type="text" class="form-control input-lg" placeholder="Enter your answer" />
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <p>
                                Please make sure that you've checked all the checkboxes above and answered the challenge question correctly before submitting this form to get the ADA presale address.
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6 col-xs-offset-1 col-xs-10">
                            <p>
                                <button class="btn btn-lg btn-default btn-block" type="button" data-toggle="modal" data-target="#myModal">Submit</button>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title sub_heading_blue text-center" id="myModalLabel">ADA presale address</h2>
                <div class="light_blue_box text-center">
                    <span id="presale_address">...</span>
                </div>
            </div>
        </div>
    </div>
</div>
