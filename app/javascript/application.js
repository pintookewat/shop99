// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require jquery.validate.additional-methods
//= require jquery.validate


$(document).on("turbolinks:load", function(){
    $("#user_new").validate({
      rules: {
        "user[full_name]": {
          required: true,
          email: true
        }
      }
      highlight: function (element, error) {
        $(element).closest('.field').addClass('error');
      },
      unhighlight: function (element, error) {
        $(element).closest('.field').removeClass('error');
      },
    });
})