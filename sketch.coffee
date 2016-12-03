slider = 0
input1 = 0
input2 = 0
rr = 0
gg = 0
bb = 0

setup = ->
  createCanvas 600,600
  slider = createSlider 0, 255, 0
  slider.position 20, 270
  slider.input sliderchange

  input1 = createInput()
  input1.position 20, 300
  input2 = createInput()
  input2.position 20, 330

  show()

mousePressed = ->
  if mouseX<256 and mouseY<256
    rr = mouseX/255
    gg = mouseY/255
    fc rr,gg,bb
    rect 300,0,256,256
    showNumbers()

sliderchange = ->
  bb = slider.value()/255
  fc rr,gg,bb
  rect 300,0,256,256
  show()

show = ->
  loadPixels()
  for r in range 256
    for g in range 256
      setPixel r,g,[r,g,255*bb,255] 
  fc rr,gg,bb
  rect 300,0,256,256

  updatePixels()
  showNumbers()

showNumbers = ->
  input1.value "#{nf(rr,1,3)}, #{nf(gg,1,3)}, #{nf(bb,1,3)}"
  input2.value "#{255*rr}, #{255*gg}, #{255*bb}"

setPixel = (i,j,pixel) ->
  index = 4 * ((0+j) * 600 + 0 + i)
  pixels[index+0] = pixel[0]
  pixels[index+1] = pixel[1]
  pixels[index+2] = pixel[2]
  pixels[index+3] = pixel[3]
