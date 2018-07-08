document.addEventListener('DOMContentLoaded', function() {

  var signUpSubmit = document.querySelector('#signUpSubmit');
  var signUpForm = document.querySelector('#signUpForm');
  var signUpModalFlash = document.querySelector('#signUpModalFlash');

  var url = window.location.href;

  signUpSubmit.addEventListener('click', function(event){

    event.preventDefault();
    console.log("signing up");

    var request = $.ajax({
                          url: signUpForm.action,
                          method: signUpForm.method,
                          data: $(signUpForm).serialize()
                        })

    request.done(function(data){
      console.log('done signup');
      if (data["failed"] === 'Unsuccessful Sign Up'){
        signUpModalFlash.innerHTML = data["failed"]
      }
      else{
        window.location.href = url;
      }

    })

  })

})
