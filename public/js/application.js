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
    $('h1').hide();
    $('.ask_question').show()
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

  $('.best-answer-display').on('submit', ".comment_form", function(e){
    e.preventDefault();
    $(this).hide();
    $('.add_answer_comment, .add_question_comment').show();
    $.ajax({
      type: "POST",
      url: $(this).attr('action'),
      data: $(this).serialize()
    })
    .done(function(response){
      $(e.target).parent().parent().parent().find('.comment-container').append(response);
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
        $(e.target).parent().empty();
        $(e.target).remove();
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


  $('.tag-question').on('submit', function(e) {
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: $(e.target).attr('action'),
      data: $(e.target).serialize()
    }).done(function(response){
      $('.tags-list').append(response)
      $('.tag-question').find('#tag-input').val("");
    })
    .fail(function(response) {
      $('.tag-question').find('#tag-input').val("");
    });
  });

  $('.question_page_container').on("submit",'.vote_buttons', function(e){
    e.preventDefault();
    points = $(e.target).parent().parent().find('.point_val')
    $.ajax({
      type: "POST",
      url: $(e.target).attr('action'),
      data: $(e.target).serialize()
    })
    .done(function(response){
      $(points).html(response)
    })
  })

  $('.answer-display').on("submit",'.vote_buttons', function(e){
    e.preventDefault();
    points = $(e.target).parent().parent().find('.point_val')
    $.ajax({
      type: "POST",
      url: $(e.target).attr('action'),
      data: $(e.target).serialize()
    })
    .done(function(response){
      $(points).html(response)
    })
  })

   $('.comment-container').on("submit",'.vote_buttons', function(e){
    e.preventDefault();
    points = $(e.target).parent().parent().find('.point_val')
    $.ajax({
      type: "POST",
      url: $(e.target).attr('action'),
      data: $(e.target).serialize()
    })
    .done(function(response){
      $(points).html(response)
    })

  })

   $('.question_page_container').on("click", ".edit", function(e){
    e.preventDefault();
    $.ajax({
      type: "GET",
      url: $(e.target).attr('href')
    })
    .done(function(response){
      $(e.target).append(response)
    })
   })
});
