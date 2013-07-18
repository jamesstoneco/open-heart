$(document).ready ->
  $("a").click ->
    $("html, body").animate
      scrollTop: $($.attr(this, "href")).offset().top
    , 1000
    false
  $('#start-hearts').click ->
    hearts(10)
  $('#kill-all-hearts').click ->
    kill_all_hearts()
  $("img.svg").each ->
    $img = $(this)
    imgID = $img.attr("id")
    imgClass = $img.attr("class")
    imgURL = $img.attr("src")
    $.get imgURL, (data) ->
      
      # Get the SVG tag, ignore the rest
      $svg = $(data).find("svg")
      
      # Add replaced image's ID to the new SVG
      $svg = $svg.attr("id", imgID)  if typeof imgID isnt "undefined"
      
      # Add replaced image's classes to the new SVG
      $svg = $svg.attr("class", imgClass + " replaced-svg")  if typeof imgClass isnt "undefined"
      
      # Remove any invalid XML tags as per http://validator.w3.org
      $svg = $svg.removeAttr("xmlns:a")
      
      # Replace image with new SVG
      $img.replaceWith $svg
