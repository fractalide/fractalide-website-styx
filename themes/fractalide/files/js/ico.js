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
    var x = 1.0;
    var d = 75.0;
    var n = 41.0;
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
    window.alert(p);
    var answer = (parseFloat($('#answer').val()) || 0).toFixed(6);
    valid &= answer === p
    window.alert(answer);
    $('#answer').parents('div.form-group').toggleClass('has-error', answer !== p);

    $('#warning_message').toggleClass('text-danger', !valid);

    return valid;
}
