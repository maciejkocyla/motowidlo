# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->

  $('[data-message-link]').click ->
    $('.new_message_modal').fadeIn()
    $('.modal_content').fadeIn()
    $('#message_recipient_id').val($(this).data('message-link'))

  $('.modal_content img').click ->
    $('.new_message_modal').fadeOut()
    $('.modal_content').fadeOut()

  $('[data-activate-link]').click ->
    $('[data-message-link]').hide()
    $('.single_message').hide()
    $('#invisible_link_' + $(this).data('activate-link')).show()
    $('.message_by_' + $(this).data('activate-link')).show()

      
