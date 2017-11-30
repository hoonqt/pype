from PIL import Image

allwhites = {}
allblacks = {}

im = Image.open('s0o0.bmp')
rgb_im = im.convert('RGB')

#file = open("shape2textr.txt","w")
#fileg = open("shape2textg.txt","w")
#fileb = open("shape2textb.txt","w")

width,height = im.size

current = (0,0,0)
whitestartpoint = 0
blackstartpoint = 0

for i in range(height):
	whitestartpoint = 0
	blackstartpoint = 0
	for j in range(width):
		r, g, b = rgb_im.getpixel((j, i))
		if (r == 255 & g == 255 & b == 255):
			if i not in allwhites:
				allwhites[i] = [j]
			else:
				if len(allwhites[i])%2 == 1:
					allwhites[i].append(j)
				else:
					if (allwhites[i][whitestartpoint+1] +1 != j):
						allwhites[i].append(j)
						whitestartpoint = whitestartpoint + 2
					else:
						allwhites[i][whitestartpoint + 1] = j

		elif (r == 0 & g == 0 & b == 0):
			if i not in allblacks:
				allblacks[i] = [j]
			else:
				if len(allblacks[i])%2 == 1:
					allblacks[i].append(j)
				else:
					if (allblacks[i][blackstartpoint+1] + 1 == j):
						allblacks[i][blackstartpoint+1] = j
					else:
						allblacks[i].append(j)
						blackstartpoint +=2


for keys in allwhites:
	for i in range(len(allwhites[keys])):
		allwhites[keys][i] = allwhites[keys][i] + 300

for keys in allwhites:
	if len(allwhites[keys]) == 1:
		allwhites[keys].append(allwhites[keys][0]+1)
	else:
		difference = allwhites[keys][1] - allwhites[keys][0]
		allwhites[keys][1] = allwhites[keys][1] + (allwhites[keys][1] - 325)
		allwhites[keys][0] = allwhites[keys][0]- (325-allwhites[keys][0])

print allwhites

donald = ""

for keys in allwhites:
	print "wire line" + str(keys) +" = (((CounterX>=" + str(allwhites[keys][0]) + ")&(CounterX<=" + str(allwhites[keys][1]) + "))&(CounterY == " + str(keys) + "));"
	donald = donald + "line" + str(keys) + " | "

print donald
