import { Application } from "@hotwired/stimulus"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

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