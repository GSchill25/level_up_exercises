$.fn.countdown = function (callback, duration, message) {
    message = message || "";
    var container = $(".countdown_message").html(duration + message);
    var countdown = setInterval(function () {
        if (--duration) {
            container.html(duration + message);
        } else {
            clearInterval(countdown);
            callback.call(container);   
        }
    }, 1000);

};

$(document).on('click','#activate', function() {
    $(".countdown").countdown(redirect, 20, " seconds");
});

function redirect () {
    this.html("Boom");
    $.get("/explode");
    window.location.replace("/explode");
}