# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->

  ready = ->
    
    $("[data-gravatar]").click ->
      $(".post_#{$(this).data('post')} #gravatar_#{$(this).data('gravatar')}").slideToggle(500)
      $(".post_#{$(this).data('post')} #user_info_#{$(this).data('gravatar')}").slideToggle(500)

    $("[data-user-info]").click ->
      $(".post_#{$(this).data('post')} #gravatar_#{$(this).data('user-info')}").slideToggle(500)
      $(".post_#{$(this).data('post')} #user_info_#{$(this).data('user-info')}").slideToggle(500)

    $('#post_content').wysihtml5({
                                  "font-styles": false,
                                  "lists": true,
                                  "image": true,
                                  "color": true
                                  })

  $(document).ready(ready)
  $(document).on('page:load', ready)

   
