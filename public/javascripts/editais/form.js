$(document).ready(function(){
  $('#edital_descricao').wysiwyg(
    {
      css: '/stylesheets/jquery.wysiwyg.custom.css',
      rmUnusedControls: true,
      controls: {
        bold          : { visible : true },
        italic        : { visible : true },
        underline     : { visible : true },
        strikeThrough : { visible : true },
        
        justifyLeft   : { visible : true },
        justifyCenter : { visible : true },
        justifyRight  : { visible : true },
        justifyFull   : { visible : true },

        insertOrderedList    : { visible : true },
        insertUnorderedList  : { visible : true },

        createLink     : { visible : true },
        insertTable    : { visible : true },

        h1: { visible: true },
        h2: { visible: true },
        h3: { visible: true },
        
        increaseFontSize : { visible : true },
        decreaseFontSize : { visible : true },
      }
    }
  );
  $('#edital_resumo').limit(250, '#charsLeft');

  $('#edital_site').bind('click', function(e){
    if( $.trim( $(e.target).val() ) == '' ) {
      $(e.target).val('http://');
    }
  });
});
