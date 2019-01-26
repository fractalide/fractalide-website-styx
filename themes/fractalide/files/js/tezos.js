$(document).ready(function () {

    $("#yourStake,#averageFeesPerBlock,#percentageOfTezThatStake").change(calculateEstimation);

    $('#yourAddress').on('keypress', function (e) {
        if (e.which == 13) {
            $("#estimation").hide();
            $("#kt1").show();

            //TODO: TEST - remove this...
            loadBackereiData(backereiTestData);

            //TODO: set the backerei.json url...
            try{
                $.getJSON("/here/goes/url/backerei.json", function (data) {
                    loadBackereiData(data);
                });
            }catch(err){
                //TODO: error handling...
                console.log(err);
            }
        }
    });

});

function calculateEstimation() {
    var yourStake = parseFloat($("#yourStake").val());
    var estiamatedBlocksPerYear = parseFloat($("#estiamatedBlocksPerYear").data("val"));
    var bakerRewardsPerBlock = parseFloat($("#bakerRewardsPerBlock").html());
    var averageFeesPerBlock = parseFloat($("#averageFeesPerBlock").val());
    var endorsementRewardsPerBlock = parseFloat($("#endorsementRewardsPerBlock").html());
    var endorsementPerBlock = parseFloat($("#endorsementPerBlock").html());
    var totalTezosSupply = parseFloat($("#totalTezosSupply").data("val"));
    var percentageOfTezThatStake = parseFloat($("#percentageOfTezThatStake").val()) / 100;
    var fractalideXTZStakePoolRewardShare = parseFloat($("#fractalideXTZStakePoolRewardShare").data("val"));
    var yourEstimated = yourStake * estiamatedBlocksPerYear * (bakerRewardsPerBlock + averageFeesPerBlock + endorsementRewardsPerBlock * endorsementPerBlock) / totalTezosSupply / percentageOfTezThatStake * fractalideXTZStakePoolRewardShare;
    $("#yourEstimated").html(yourEstimated.toFixed(2));
    $("#yourEstimatedPercentage").html((yourEstimated/100).toFixed(1));
}

function loadBackereiData(data) {
    var trs = [];
    $.each(data.payoutsByCycle, function (key, val) {
        var tr = ["<tr>"];
        tr.push("<td>" + key + "</td>");
        tr.push("<td>" + "..." + "</td>");
        tr.push("<td>" + val.estimatedTotalRewards + "</td>");
        tr.push("<td>" + "..." + "</td>");
        tr.push("<td class=\"text_blue\">Paid out</td>");
        tr.push("</tr>");
        trs.push(tr.join(""));
    });
    $(".kt1_data table tbody").html(trs.join(""));
}

//TODO: remove this...
var backereiTestData = {
    "payoutsByCycle": {
        "56": {
            "delegators": {
                "KT1TqnJ4Mr9zX5NX4en45bq34NtCyZ8uQ5QD": {
                    "balance": "57539259",
                    "estimatedRewards": "63641"
                }
            },
            "estimatedBakerRewards": {
                "bondRewards": "119925127",
                "feeRewards": "11230",
                "looseRewards": "2",
                "totalRewards": "119936359"
            },
            "estimatedTotalRewards": "120000000",
            "fee": {
                "denominator": 20,
                "numerator": 3
            },
            "stakingBalance": "92219067948",
            "stolenBlocks": []
        },
        "57": {
            "delegators": {
                "KT1TqnJ4Mr9zX5NX4en45bq34NtCyZ8uQ5QD": {
                    "balance": "115222149",
                    "estimatedRewards": "44577"
                }
            },
            "estimatedBakerRewards": {
                "bondRewards": "41947556",
                "feeRewards": "7866",
                "looseRewards": "1",
                "totalRewards": "41955423"
            },
            "estimatedTotalRewards": "42000000",
            "fee": {
                "denominator": 20,
                "numerator": 3
            },
            "stakingBalance": "92276750838",
            "stolenBlocks": []
        },
        "58": {
            "delegators": {
                "KT1TqnJ4Mr9zX5NX4en45bq34NtCyZ8uQ5QD": {
                    "balance": "115222149",
                    "estimatedRewards": "57313"
                }
            },
            "estimatedBakerRewards": {
                "bondRewards": "53932572",
                "feeRewards": "10114",
                "looseRewards": "1",
                "totalRewards": "53942687"
            },
            "estimatedTotalRewards": "54000000",
            "fee": {
                "denominator": 20,
                "numerator": 3
            },
            "stakingBalance": "92276750838",
            "stolenBlocks": []
        },
        "59": {
            "delegators": {
                "KT1TqnJ4Mr9zX5NX4en45bq34NtCyZ8uQ5QD": {
                    "balance": "226280248",
                    "estimatedRewards": "99929"
                }
            },
            "estimatedBakerRewards": {
                "bondRewards": "47882436",
                "feeRewards": "17634",
                "looseRewards": "1",
                "totalRewards": "47900071"
            },
            "estimatedTotalRewards": "48000000",
            "fee": {
                "denominator": 20,
                "numerator": 3
            },
            "stakingBalance": "92387808937",
            "stolenBlocks": []
        },
        "60": {
            "delegators": {
                "KT1TqnJ4Mr9zX5NX4en45bq34NtCyZ8uQ5QD": {
                    "balance": "282533702",
                    "estimatedRewards": "239000"
                }
            },
            "estimatedBakerRewards": {
                "bondRewards": "91718823",
                "feeRewards": "42176",
                "looseRewards": "1",
                "totalRewards": "91761000"
            },
            "estimatedTotalRewards": "92000000",
            "fee": {
                "denominator": 20,
                "numerator": 3
            },
            "stakingBalance": "92444062391",
            "stolenBlocks": []
        }
    }
};