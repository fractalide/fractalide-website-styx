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
                                <b>Currency type:</b> A privacy preserving proof of stake utility cybercoin for an information-centric network browser
                            </p>
                            <p>
                                <b>Total supply:</b> uncapped
                            </p>
                            <p>
                                <b>ICO duration:</b> 9 months
                            </p>
                        </div>
                        <div class="col-md-5 col-xs-12 light_blue_box">
                            <p>
                                <b>Price:</b> Starting at 90% discount at first epoch to 0% discount at last epoch where <code>0.00001337 satoshi BTC</code> buys <code>1 CEO</code>.
                            </p>
                            <p>
                                $$p = x \cdot 0.01 \cdot (100 - d + {e \over (n - 1)} \cdot d)$$
                            </p>
                            <p>
                                <b>x</b> = exchange rate of 1 CEO to 0.00001337 Satoshi in final epoch
                                <br/>
                                <b>d</b> = initial discount of 90%
                                <br/>
                                <b>n</b> = 9 months to complete ICO
                                <br/>
                                <b>e</b> = epoch to query for Satoshi price (p)
                                <br/>
                                <b>p</b> = Satoshi price at queried epoch (e)
                            </p>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-offset-3 col-md-6 col-xs-offset-1 col-xs-10">
                            <a class="btn btn-lg btn-primary btn-block" href="/fractalide-whitepaper.pdf">Download whitepaper</a>
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
                    <h2 class="sub_heading_blue">ICO public sale has not started</h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
                            <div class="progress">
                                <div class="progress-bar" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                    <span class="sr-only">0% Complete</span>
                                </div>
                            </div>                            
                            <div class="text-center">
                                <p class="sale_progress">50% completed</p>
                            </div>
                            <p><b>ICO started at timestamp:</b> <span class="pull-right">X</span></p>
                            <p><b>Current ICO Tranche:</b> <span class="pull-right">X+n</span></p>
                            <p><b>ICO Ends at timestamp:</b> <span class="pull-right">X+m</span></p>
                            <p><b>Discount at ICO Tranche 0:</b> <span class="pull-right">90% off</span></p>
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
                                I understand there is no KYC/AML requirement in this presale.
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
                                I agree not participate in this presale if I'm a citizen of United States of America, China or India.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="panel-body text-center">
                    <form class="form-horizontal light_blue_box">
                        <h2 class="sub_heading_blue">What is the price in satoshi (p) of 1 LUCEO at epoch (e) <val id="epoch">e</val>?</h2>
                        <div class="form-group form-group-lg">
                            <div class="col-md-offset-2 col-md-8 col-xs-12">
                                <input type="text" class="form-control input-lg" id="answer" placeholder="Enter your answer" />
                                <span class="text-danger hidden">...</span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <p id="warning_message">
                                Please make sure that you've checked all the checkboxes above and answered the challenge question correctly before submitting this form to get the ICO tutorial.
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6 col-xs-offset-1 col-xs-10">
                            <p>
                                <button class="btn btn-lg btn-primary btn-block" type="button" data-toggle="modal" data-target="#presaleAddressModal" id="btnSubmit">Submit</button>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="presaleAddressModal" tabindex="-1" role="dialog" aria-labelledby="presaleAddressModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title sub_heading_blue text-center" id="myModalLabel">Multipass</h2>
                <img class="multipass no-repeat center" src="/img/multipass.jpg"/>
                <a class="btn btn-lg btn-primary btn-block" href="/ico/tutorial"">Luceo ICO Tutorial</a>
            </div>
        </div>
    </div>
</div>

<script src="/js/ico.js"></script>
