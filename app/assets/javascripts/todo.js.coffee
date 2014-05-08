$(document).on 'ready page:load', ->
  $( "#todos" ).sortable
    update: (event, ui) ->
      $.post($(this).data('sort-url'), $(this).sortable('serialize'))
