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

  //submit question to list

  $(".content").on('submit',".question_form", function(e){
    e.preventDefault();
    $(this).hide();
    // debugger;
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
      $('#question').append(response)
    });
  });

  //show answer comment form

  $(".best-answer-display").on("click", ".add_answer_comment", function(e){
    e.preventDefault();
    $(this).hide();
    $.ajax({
      url: $(this).attr('href'),
      type: "GET"
    })
    .done(function(response) {
      $(e.target).parent().append(response)
    });
  });

  //append comment to appropriate container for question

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
      $('.new_comment').remove();
    })
  });

  //append comment to appropriate container for answer - working

  $('.best-answer-display').on('submit',".comment_form", function(e){
    e.preventDefault();
    $(this).hide();
    debugger;
    $('.add_answer_comment, .add_question_comment').show();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    })
    .done(function(response){
      $(e.target).parent().parent().find('.comment-container').append(response);
      $(e.target).parent().parent().find('.new_comment').remove();
    })
  });

  // Deletes comments and answers - working

  $('.question_page_container').on("submit", ".delete", function(e){
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


  //submit answer to question
  
  $('#post-answer').on("submit", function(e){
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: $(e.target).attr('action'),
      data: $(e.target).serialize()
    })
    .done(function(response){
      $(e.target).find('textarea').val("");
      $('.best-answer-display').append(response)
    })
  })
});
