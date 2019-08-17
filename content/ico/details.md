<div class="container">
    <div class="row">
        <div class="col-md-offset-2 col-md-8 col-sm-offset-2 col-sm-8 col-xs-offset-1 col-xs-10">
            <div class="panel panel-default">
                <div class="panel-body text-center">
                    <h2 class="sub_heading_blue">Coin Details</h2>
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
                                <b>Currency type:</b> A privacy preserving, immutable, permissionless, proof of stake utility digital currency for a citizen in a tyrannical society.
                            </p>
                            <p>
                                <b>First use case:</b> As Fractalide makes data dissemination very cheap, the first app is an pay (optional) per video stream, used in protests and webcams.
                            </p>
                            <p>
                                <b>Total supply:</b> Hard capped at ICO end
                            </p>
                            <p>
                                <b>ICO duration:</b> 365 days
                            </p>
                        </div>
                        <div class="col-md-5 col-xs-12 light_blue_box">
                            <p>
                                <b>Price:</b> Starting at 90% discount at first tranche to no discount at last tranche where <code>0.00001337 Satoshi BTC</code> buys <code>1 CEO</code>.
                            </p>
                            <p>
                                <!--
                                  p = 0.01x \cdot ((100 - d) + e \cdot {d \over (n-1)})
                                  https://www.codecogs.com/latex/eqneditor.php
                                -->
                                <img class="formula" src="/svg/equation.svg">
                            </p>
                            <p>
                                <b>x</b> = exchange rate of <code>1</code> where 1 CEO to 0.00001337 Satoshi in final epoch
                                <br/>
                                <b>d</b> = initial discount of <code>90%</code>
                                <br/>
                                <b>n</b> = number of tranches is <code>365</code>
                                <br/>
                                <b>e</b> = current tranche the ICO is in
                                <br/>
                                <b>p</b> = the discount
                            </p>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="col-md-offset-3 col-md-6 col-xs-offset-1 col-xs-10">
                            <a class="btn btn-lg btn-primary btn-block" href="/fractalide-whitepaper.pdf">Whitepaper</a>
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
                    <h2 class="sub_heading_blue"><val id="ico_header">ico_header</val></h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 col-xs-12">
                            <div class="progress">
                                <div id="theprogressbar" class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
                                    <span class="sr-only">0% Complete</span>
                                </div>
                            </div>                            
                            <div class="text-center">
                                <p id="sale_progress" class="sale_progress">0% completed</p>
                            </div>
                            <p><b>ICO start:</b> <span class="pull-right"><val id="ico_start">ico_start_in_seconds</val></span></p>
                            <p><b>Today's ICO tranche:</b> <span class="pull-right"><val id="current_tranche">current_tranche</val>/<val id="number_of_tranches">number_of_tranches</val></span></p>
                            <p><b>Today's discount:</b> <span class="pull-right"><val id="percentage_discounted">percentage_discounted</val></span></p>
                            <p><b>Today 1 CEO costs:</b> <span class="pull-right"><val id="current_price">current_price</val></span></p>
                            <p><b>ICO end:</b> <span class="pull-right"><val id="ico_end">ico_end_in_seconds</val></span></p>
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
                    <h2 class="sub_heading_blue">Please agree to the below points</h2>
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
                                I understand and accept there is no KYC/AML requirement in this sale.
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
                                I am solely responsible for following any laws of my country and will be held accountable to the law of my country.
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
                                I have no expectation the luceo coins I purchase will increase or decrease in value, my luceo coins bought are on an "as is" basis only.
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
                                I agree not to participate in this presale if I'm a citizen of United States of America, China or India.
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
                                THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-offset-3 col-md-6 col-xs-offset-1 col-xs-10">
                            <p>
                                <button class="btn btn-lg btn-primary btn-block" type="button" data-toggle="modal" data-target="#presaleAddressModal" id="btnSubmit">Agree</button>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <p id="warning_message">
                                Please make sure that you've checked all the checkboxes above to get the ICO tutorial.
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
                <a href="/ico/tutorial"><img class="multipass"  src="/img/multipass.jpg"/></a>
                <a class="btn btn-lg btn-primary btn-block" href="/ico/tutorial">Luceo ICO Tutorial</a>
            </div>
        </div>
    </div>
</div>

<script src="/js/ico.js"></script>
