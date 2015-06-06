# Author: Maxwell Barvian
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require foundation
#= require_tree .

ready = ->
  $(document).foundation()

  # Non-link links
  $('[data-clickable]').click (event) ->
    unless $(event.target).is('a') || $(event.target).closest('a').length # User probably clicked an action, abort
      event.preventDefault()

      document.location = $(this).data('clickable')

  # Dismiss auto-close alerts
  $('[data-timeout]').each ->
    $timeout = $(this)
    setTimeout ->
      if $timeout.is('.alert-box') then $timeout.find("a.close").trigger("click.fndtn.alert") else $timeout.fadeOut()
    , $timeout.data('timeout') * 1000

  # Expandables
  $expandables = $('[data-expandable]')
  $expandables.click (event) ->
    unless $(event.target).is('a') || $(event.target).closest('a').length # User probably clicked an action, abort
      event.preventDefault()

      clicked = this # Save reference to clicked expandable
      $expandables.each ->
        $expandable = $(this)
        $expand = $expandable.find('.expand')

        shouldExpand = this is clicked && !$expandable.hasClass('expanded')
        $expandable.toggleClass('expanded', shouldExpand)
        if shouldExpand then $expand.slideDown(200) else $expand.slideUp(200)

$(document).ready ready
$(document).on 'page:load', ready
