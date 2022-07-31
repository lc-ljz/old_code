
#import argparse
#parser = argparse.ArgumentParser()
#parser.add_argument("square", help="display a square of a given number")
#args = parser.parse_args()
#print (args.square**2)

from PIL import Image,ImageDraw,ImageFont
img=Image.new("RGB",(800,800),"black")
draw=ImageDraw.Draw(img)
font=ImageFont.truetype('simfang.ttf',int(800 * 0.9))
draw.text((0, 0), '刘', (255, 255, 255),font=font)
#img.show()
data = list(img.getdata())
#print(data)
sum_val = 0
for i_data in data:
    sum_val += sum(i_data)
print(sum_val)
