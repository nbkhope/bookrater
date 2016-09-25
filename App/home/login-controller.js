angular.module('bookRater')

.controller('LoginCtrl', function() {
    var ctrl = this;

    ctrl.user = {
      username: '',
      password: ''
    };

    ctrl.submit = function() {
      console.log("Login form has been submitted");
    };
});
