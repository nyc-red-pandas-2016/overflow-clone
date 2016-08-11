$(document).ready(function() {
  //show add_question form - works
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

  //append question to list - broken
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

    //show question comment form - works
    $(".add_question_comment").on("click", function(e){
    e.preventDefault();
    $(this).hide();
    $.ajax({
      url: $(this).attr('href'),
      type: "GET"
    })
    .done(function(response) {
      // debugger;
      $('#question').append(response)
    });
  });

    //show answer comment form - works
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

    //append comment to appropriate container for question - kind of broken (remove white space)

    $('#question').on('submit', ".comment_form", function(e){
    e.preventDefault();
    $(this).hide();
    $('.add_answer_comment, .add_question_comment').show();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    })
    .done(function(response){
      $('.comment_question').append(response)
    })
  });

    //append comment to appropriate container for answer - broken

    $('.best-answer-display').on('submit',".comment_form", function(e){
    e.preventDefault();
    $(this).hide();
    $('.add_answer_comment, .add_question_comment').show();
    debugger;
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    })
    .done(function(response){
      // Need to fix.
      $('.comment-container').append(response)
    })
  });

    // Deletes comments and answers - broken

    $('.answer-and-comment-combined').on("submit", ".delete", function(e){
      e.preventDefault();
      $.ajax({
        type: "DELETE",
        url: $(this).attr('action'),
        data: $(this).find('.id-to-delete').val()
      })
      .done(function(response) {
        $(e.target).parent().parent().empty();
        $(e.target).parent().remove();
      })
    })

    // Deletes comments on question - broken

    $('.container').on("submit", ".delete", function(e){
      e.preventDefault();
      $.ajax({
        type: "DELETE",
        url: $(this).attr('action'),
        data: $(this).find('.id-to-delete').val()
      })
      .done(function(response) {
        $(e.target).parent().parent().empty();
        $(e.target).parent().remove();
      })
    })

    $('#post-answer').on("submit", function(e){
      e.preventDefault();
      $.ajax({
        type: "POST",
        url: $(e.target).attr('action'),
        data: $(e.target).serialize()
      })
      .done(function(response){
        debugger;
        $('.best-answer-display').append(response)
      })
    })
});
