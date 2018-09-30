$(document).ready(function(){
    generateRandomEpoch();

    $('#presaleAddressModal').on('show.bs.modal', function (e) {
        if(!isValidAnswer()) {
            e.preventDefault();
            generateRandomEpoch();
        }
    });

});

function generateRandomEpoch(){
    var e = Math.floor(Math.random() * 41); // generate a random number from 0 to 40
    $('#epoch').html(e);
}

function calculateP(e) {
    // e = epoch to query for ADA price (p)
    // p = ADA price at queried epoch (e)
    var x = 1.0; //exchange rate of 1 ADA in final epoch
    var d = 75.0; //initial discount of 75%
    var n = 41.0; //41 epochs to complete presale (0 upto and including 40)
    var p = x * 0.01 * (100.0 - d + e / (n - 1.0) * d);
    return p.toFixed(6);
}

function isValidAnswer() {
    var valid = true;

    $('.checklist input[type=checkbox]').each(function(i) {
        valid &= $(this).is(':checked');
        $(this).toggleClass('error', $(this).is(':not(:checked)'));
    });

    var p = calculateP(parseInt($('#epoch').html()));
    var answer = (parseFloat($('#answer').val()) || 0).toFixed(6);
    valid &= answer === p;
    $('#answer').parents('div.form-group').toggleClass('has-error', answer !== p);
    $('#answer ~ span').html('Ouch! The right answer for epoch ' + $('#epoch').html() + '  was: ' + p).toggleClass('hidden', answer === p);

    $('#warning_message').toggleClass('text-danger', !valid);

    return valid;
}
