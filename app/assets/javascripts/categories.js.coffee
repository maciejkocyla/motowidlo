# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

$ ->
  
  $("[data-menu-button]").hover ->
    $("#submenu-"+$(this).data("menu-button")).slideToggle(5)
  $("[data-submenu]").hover ->
    $(this).slideToggle(1)
