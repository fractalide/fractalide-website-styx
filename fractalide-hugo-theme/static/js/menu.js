$(document).ready(function() {
    $(window).scroll(function() {
        if ($(document).scrollTop() > 50) {
            $("nav").removeClass("navbar-default");
            $("nav").addClass("navbar-inverse");
            $("#brand").attr("src", $("#brand").data("logo-blue") );
        } else {
            $("nav").addClass("navbar-default");
            $("nav").removeClass("navbar-inverse");
            $("#brand").attr("src", $("#brand").data("logo") );
        }
    });
});
