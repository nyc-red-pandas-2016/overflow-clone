$(document).ready(function () {

  $('.tabs').click(function(event) {
    $('.tab-content').css('display', 'none');
    $('.tabs li').removeClass('active');
      if( $(event.target).is('li') ){
        $(event.target).addClass('active');
        var child = event.target.children[0]
        var id_tag = $(child).attr('href');
        $(id_tag).toggle();
      }
      else{
        $(event.target.parentElement).addClass('active');
        var id_tag = $(event.target).attr('href');
        $(id_tag).toggle();
      };
  });
});