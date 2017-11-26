from PIL import Image

allwhites = {}

im = Image.open('shape2.png')
rgb_im = im.convert('RGB')

#file = open("shape2textr.txt","w")
#fileg = open("shape2textg.txt","w")
#fileb = open("shape2textb.txt","w")

width,height = im.size

current = (0,0,0)
startpoint = 0

for i in range(height):
	for j in range(width):
		r, g, b = rgb_im.getpixel((j, i))
		if (r == 255 & g == 255 & b == 255):
			if i not in allwhites:
				allwhites[i] = [j]
			else:
				if len(allwhites[i]) == 1:
					allwhites[i].append(j)
				else:
					if (allwhites[i][startpoint+1] +1 != j):
						allwhites[i].append(j)
						startpoint = 2
					else:
						allwhites[i][startpoint + 1] = j

print allwhites