# need to add this css somehow in javascript ideally

heart_css = ".heart { width: 126px; height: 117px; position: fixed; background-image: url('javascripts/vendor/open-heart/heart.png'); }"

# perlin = new toxi.math.noise.PerlinNoise()
x = 1
x_inc = 1
x_displacement = 100

hearts_random = (number_of_hearts, sprite_width, sprite_height, min_time, add_time) ->
  $('.heart').each ->  
    # console.log($('.heart first').width())
    $(@).animate
      top: sprite_height + Math.floor((Math.random() * ($(window).height() - (sprite_height * 2.0))))
      left: sprite_width + Math.floor((Math.random() * ($(window).width() - (sprite_width * 2.0))))
    , min_time + Math.floor(Math.random() * add_time) # time to animate
    , ->
      hearts_random(number_of_hearts, sprite_width, sprite_height, min_time, add_time) # keep calling when animation is done

hearts_to_center = ->
  $('.heart').each ->  
    $(@).animate
      top: Math.floor($(window).height() / 2)
      left: Math.floor($(window).width() / 2)
    , 0 # time to animate

hearts_perlin = ->
  x_displacement = Math.floor(($(window).width() - 126) * 0.5)
  $('.heart').each ->  
     x_calc = Math.floor((perlin.noise(x++) - 0.5) * x_displacement)
    $(@).animate
      top: "+=#{x_calc}"
      left: "+=#{x_calc}"
    , 1000 + Math.floor(Math.random() * 5000) # time to animate
    , ->
      hearts_perlin()

hearts_create_divs = (number_of_hearts) ->
  for i in [1..number_of_hearts] by 1
    $('body').append '<div class="heart"></div>'
  # $('.heart').css('width', '126px')
  # $('.heart').css('height', '117px')
  # $('.heart').css('position', 'fixed')
  # $('.heart').css('background-image', "url('javascripts/vendor/open-heart/heart.png'")

# heart_css = ".heart { width: 126px; height: 117px; position: fixed; background-image: url('javascripts/vendor/open-heart/heart.png'); }"

hearts = (no_of_hearts) ->
  hearts_create_divs(no_of_hearts)
  hearts_to_center()
  # start animation
  hearts_random(no_of_hearts, $('.heart first').width(), $('.heart first').height(), 500, 2000)

kill_all_hearts = ->
  $('.heart').remove()