$(document).ready(function(){

    generateRandomEpoch();

    $('#myModal').on('show.bs.modal', function (e) {
        if(!isValidAnswer()) {
            e.preventDefault();
            generateRandomEpoch();
        }
    });

});

function generateRandomEpoch(){
    var e = Math.floor(Math.random() * 42);
    $('#epoch').html(e);
}

function calculateP(e) {
    var x = 0.01;
    var d = 75;
    var n = 41;
    var p = x * 0.01 * (100 - d + e / (n - 1) * d);
    return p.toFixed(4);
}

function isValidAnswer() {
    var valid = true;

    $('.checklist input[type=checkbox]').each(function(i) {
        valid &= $(this).is(':checked');
        $(this).toggleClass('error', $(this).is(':not(:checked)'));
    });
    
    var p = calculateP(parseInt($('#epoch').html()));
    var answer = (parseFloat($('#answer').val()) || 0).toFixed(4);
    valid &= answer === p
    $('#answer').parents('div.form-group').toggleClass('has-error', answer !== p);

    $('#warning_message').toggleClass('text-danger', !valid);
    
    return valid;
}
