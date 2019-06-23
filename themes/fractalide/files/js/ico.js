$(document).ready(function(){
    setup();
    $('#presaleAddressModal').on('show.bs.modal', function (e) {
        if(!isValidAnswer()) {
            e.preventDefault();
        }
    });
});

function setup() {
  var number_of_tranches = 200.0;
  var ico_start_in_seconds = new Date('2019-07-23').getTime() / 1000;
  var ico_end_in_seconds = new Date('2020-07-22').getTime() / 1000;
  var now = new Date().getTime() / 1000;

  var days_per_year = 365.0;
  var ico_tranches_per_year = number_of_tranches;
  var ico_tranches_per_day = ico_tranches_per_year / days_per_year;
  var ico_tranches_per_second = ico_tranches_per_day / (60.0 * 60.0 * 24.0); //secs * mins * hrs
  var ico_length_in_secs = ico_end_in_seconds - ico_start_in_seconds;
  var gap = ico_length_in_secs / number_of_tranches;
  var current_ico_tranche = Math.floor(ico_tranches_per_second * (now - ico_start_in_seconds));
  var progress = (current_ico_tranche / number_of_tranches) * 100;

  var exchange_rate = 1.0;
  var initial_discount = 90.0;
  var discount = exchange_rate * 0.01 * ((100 - initial_discount) + (current_ico_tranche * (initial_discount / (number_of_tranches - 1))));
  var percentage_discounted = (100 -(discount * 100)).toFixed(3);
  var price_in_satoshi_per_ceo_in_final_tranche = 0.00001337;
  var current_price = price_in_satoshi_per_ceo_in_final_tranche * discount;

  $('#ico_start').html(GetFormattedDate(ico_start_in_seconds));
  $('#ico_end').html(GetFormattedDate(ico_end_in_seconds));
  $('#number_of_tranches').html(number_of_tranches);

  if (current_ico_tranche < 0){
    $('#ico_header').html("Luceo public sale due to start");
    $('#theprogressbar').attr('aria-valuenow', current_ico_tranche).css('width', "0%");
    $('#theprogressbar').attr('aria-valuemax', number_of_tranches);
    $('#sale_progress').html( "");
    $('#current_tranche').html("-");
    $('#percentage_discounted').html( "-");
    $('#current_price').html( "-" );
  } else if (current_ico_tranche <= (number_of_tranches-1)) {
    $('#ico_header').html("Luceo public sale underway");
    $('#theprogressbar').attr('aria-valuenow', current_ico_tranche).css('width', progress.toFixed(0)+"%");
    $('#theprogressbar').attr('aria-valuemax', number_of_tranches);
    $('#sale_progress').html( progress.toFixed(0) + "% completed");
    $('#current_tranche').html((current_ico_tranche + 1));
    $('#percentage_discounted').html( percentage_discounted + "% off");
    $('#current_price').html(current_price.toFixed(8));
  } else if (current_ico_tranche > (number_of_tranches-1)) {
    $('#ico_header').html("ICO public sale concluded");
    $('#theprogressbar').attr('aria-valuenow', current_ico_tranche).css('width', "100%");
    $('#theprogressbar').attr('aria-valuemax', number_of_tranches);
    $('#sale_progress').html( "");
    $('#current_tranche').html("-");
    $('#percentage_discounted').html( "-");
    $('#current_price').html( "-" );
  }
}

function GetFormattedDate(secs) {
  var t = new Date(1970, 0, 1);
  t.setSeconds(secs);
  var monthNames = [
    "January", "February", "March",
    "April", "May", "June", "July",
    "August", "September", "October",
    "November", "December"
  ];
  var day = t.getDate();
  var monthIndex = t.getMonth();
  var year = t.getFullYear();
  return day + ' ' + monthNames[monthIndex] + ' ' + year;
}


function isValidAnswer() {
    var valid = true;
    $('.checklist input[type=checkbox]').each(function(i) {
        valid &= $(this).is(':checked');
        $(this).toggleClass('error', $(this).is(':not(:checked)'));
    });
    $('#warning_message').toggleClass('text-danger', !valid);
    return valid;
}
