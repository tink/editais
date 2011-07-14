$(document).ready(function(){
  $('#edital_resumo').limit(250, '#charsLeft');

  $('#edital_site').bind('click', function(e){
    if( $.trim( $(e.target).val() ) == '' ) {
      $(e.target).val('http://');
    }
  });
});
