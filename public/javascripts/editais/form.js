$(document).ready(function(){
  $('#edital_site').bind('click', function(e){
    if( $.trim( $(e.target).val() ) == '' ) {
      $(e.target).val('http://');
    }
  });
});
