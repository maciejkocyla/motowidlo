# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

  ready = ->
    
    $("[data-gravatar]").click ->
      $('#gravatar_' + $(this).data("gravatar")).slideToggle(500)
      $('#user_info_' + $(this).data("gravatar")).slideToggle(500)

    $("[data-user-info]").click ->
      $('#gravatar_' + $(this).data("user-info")).slideToggle(500)
      $('#user_info_' + $(this).data("user-info")).slideToggle(500)

  $(document).ready(ready)
  $(document).on('page:load', ready)

   
