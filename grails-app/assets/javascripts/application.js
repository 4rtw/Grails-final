// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require core/jquery.3.2.1.min
//= require core/popper.min
//= require core/bootstrap.min
//= require plugins/bootstrap-switch
//= require plugins/chartist.min
//= require plugins/bootstrap-notify
//= require light-bootstrap-dashboard
//= require demo
/// require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('#spinner').fadeIn();
        }).ajaxStop(function() {
            $('#spinner').fadeOut();
        });
    })(jQuery);
}
