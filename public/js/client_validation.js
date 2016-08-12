$(document).ready(function() {
  var isValidEmail = function(string) {
    return string.match(/^\w+@\w+[.]\w+$/);
  }

  var isOverFiveCharacters = function(string) {
    return string.length >= 6;
  }

  var hasCapitalLetter = function(string) {
    return string.match(/[A-Z]/);
  }

  var isNotBlank = function(string) {
    return string.length > 0;
  }

  var passwordValid = function(password) {
    return isOverFiveCharacters(password) && isNotBlank(password) && hasCapitalLetter(password);
  }

  var emailValid = function(email) {
    return isValidEmail(email) && isNotBlank(email);
  }

  var registerValidator = function(username, email, password) {
    return passwordValid(password) && emailValid(email) && isNotBlank(username)
  };

  $('#register-form').submit(function(event) {
    var username = $(this).find('#username-input').val();
    var email = $(this).find('#email-input').val();
    var password = $(this).find('#password-input').val();
    if (!registerValidator(username, email, password)) {
      event.preventDefault();
      $('#register-errors').empty();
      if (!isNotBlank(username)) {
        $('#register-errors').append("<li>Username can't be blank</li>");
      };
      if (!isNotBlank(email)) {
        $('#register-errors').append("<li>E-mail can't be blank</li>");
      };
      if (!isValidEmail(email)) {
        $('#register-errors').append("<li>E-mail must be a valid e-mail address</li>");
      };
      if (!isNotBlank(password)) {
        $('#register-errors').append("<li>Password can't be blank</li>");
      };
      if (!isOverFiveCharacters(password)) {
        $('#register-errors').append("<li>Password is too short (minimum is 6 characters)</li>");
      };
      if (!hasCapitalLetter(password)) {
        $('#register-errors').append("<li>Password must have at least one capital letter</li>");
      };
    };
  })
});