# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$ ->
  ready = ->
    $("[data-button]").click ->
      $(".subcategories_choice").slideUp(160)
      $(".menu_button").removeClass("active_button")
      $("#data_button_" + $(this).data("button")).addClass("active_button")
      $("#subcategories_choice_" + $(this).data("button")).slideToggle(360)
      return false

    $(document).click ->
      $(".subcategories_choice").slideUp("fast")

  $(document).ready(ready)
  $(document).on('page:load', ready)
