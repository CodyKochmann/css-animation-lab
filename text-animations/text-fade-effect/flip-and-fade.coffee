doc=document
str=(s)->s.toString()
float=(o)->parseFloat(o)
int=(o)->parseInt(o)
len=(o)->o.length
byClass=(n)->doc.getElementsByClassName(n)
log=(s)->console.log(s)

delay = (ms, func) -> setTimeout func, ms

rand=()->Math.random()
randInt=(min=0,max=rand()*10)->int(min+(rand()*(max-min)))
randFloat=(min=0,max=rand())->min+(rand()*(max-min))

transform=(e,s="")->
  e.style.webkitTransform = s
  e.style.MozTransform = s
  e.style.msTransform = s
  e.style.OTransform = s
  e.style.transform = s
  return

#transform(byClass('flipfade')[0],'translateY(300px)')

# split every letter into its own p tag

for i in byClass('flipfade')
  new_string=""
  code=i.innerHTML
  for t in code.split('')
    new_string+="<span class='flipfade_span'>#{t}</span>"
  i.innerHTML=new_string


fadeIn=(e,speed,del)->
  log(speed)
  e.style.transitionDuration=speed
  log(del)
  delay del, ->
    e.style.opacity=0.9
    return
  return

count=0
for i in byClass('flipfade_span')
  s=i.style
  count+=1
  i.style.opacity=0
  fadeIn(i,"#{randInt(1,3)}s",(randInt(500,2000)+(count*60)))  


