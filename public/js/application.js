$(document).ready(function() {
  //show add_question form
  $(".ask_question").on("click", function(e){
    e.preventDefault();
    $(this).hide();
    $.ajax({
      url: $(this).attr('href'),
      type: "GET"
    })
    .done(function(response) {
      $('.content').append(response)
    });
  });

  //append question to list
  $('.question_form').on('submit', function(e){
    e.preventDefault();
    $(this).hide();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    })
    .done(function(response){
      $('.questions').append(response)
    })
  });

    //show question comment form
    $(".add_question_comment").on("click", function(e){
    e.preventDefault();
    $(this).hide();
    $.ajax({
      url: $(this).attr('href'),
      type: "GET"
    })
    .done(function(response) {
      $('.question-display').append(response)
    });
  });

    //show answer comment form
    $(".add_answer_comment").on("click", function(e){
    e.preventDefault();
    $(this).hide();
     // debugger;
    $.ajax({
      url: $(this).attr('href'),
      type: "GET"
    })
    .done(function(response) {
      // var answer_class = $(response).find('#commentable-id').attr('value')
      $(e.target).parent().append(response)
    });
  });

    //append comment to appropriate container

  //   $('.comment_form').on('submit', function(e){
  //   e.preventDefault();
  //   $(this).hide();
  //   $('.add_answer_comment, .add_question_comment').show();
  //   $.ajax({
  //     type: "POST",
  //     url: $(this).attr('action'),
  //     data: $(this).serialize()
  //   })
  //   .done(function(response){
  //     debugger;
  //     $('.comment-container').append(response)
  //   })
  // });
});
