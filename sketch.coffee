slider = 0
input1 = 0
input2 = 0
rr = 0
gg = 0
bb = 0

setup = ->
  canvas = createCanvas 512,256
  canvas.position 20,20
  pixelDensity 1

  slider = createSlider 0, 255, 0
  slider.position 20, 285
  slider.input sliderchange
  slider.size 512,20

  input1 = createInput()
  input1.position 20, 320
  input1.size 256, 20

  input2 = createInput()
  input2.position 256+20, 320
  input2.size 256, 20

  sc()
  show()

mousePressed = ->
	if 0 <= mouseX < 256 and 0 <= mouseY < 256
    rr = mouseX
    gg = mouseY
    showNumbers()

sliderchange = ->
  bb = slider.value()
  show()

show = ->
  loadPixels()
  for r in range 256
    for g in range 256
      setPixel r,g,[r,g,bb,255] 
  updatePixels()
  showNumbers()

showNumbers = ->
  input1.value "#{nf(rr/255,1,3)}, #{nf(gg/255,1,3)}, #{nf(bb/255,1,3)}"
  input2.value "#{rr}, #{gg}, #{bb}"
  fill rr,gg,bb
  rect 256,0,256,256

setPixel = (i,j,pixel) ->
  index = 4 * (j * 512 + i)
  pixels[index+0] = pixel[0]
  pixels[index+1] = pixel[1]
  pixels[index+2] = pixel[2]
  pixels[index+3] = pixel[3]
