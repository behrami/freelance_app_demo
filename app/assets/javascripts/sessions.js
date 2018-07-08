document.addEventListener('DOMContentLoaded', function() {

  var signInSubmit = document.querySelector('#signInSubmit');
  var signInForm = document.querySelector('#signInForm');
  var signInModalFlash = document.querySelector('#signInModalFlash');

  var url = window.location.href;

  signInSubmit.addEventListener('click', function(event){

    event.preventDefault();
    console.log("signing in");

    var request = $.ajax({
                          url: signInForm.action,
                          method: signInForm.method,
                          data: $(signInForm).serialize()
                        })

    request.done(function(data){
      console.log('done signin');
      if (data["failed"] === 'Unsuccessful Sign In'){
        signInModalFlash.innerHTML = data["failed"]
      }
      else{
        window.location.href = url;
      }

    })

  })

})
