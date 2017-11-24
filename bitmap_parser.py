from PIL import Image
import numpy as np

im = Image.open("hexbitmap.bmp")
pixels = list(im.getdata())
width, height = im.size
pixels = [pixels[i * width:(i + 1) * width] for i in xrange(height)]

offset_x = 250
offset_y = 250

list_R = []
list_G = []
list_B = []

color_display = ""


for row in range(1,height+1):

	color_left_bound = 0
	color_next_bound = 0
	current_color = (0, 0, 0)
	lucid_lines = "wire line" + str(row) + " = ("
	line = str(row) + " "

	for index, pixel_color in enumerate(pixels[row-1]):

		if pixel_color == None:
			pixel_color = (0, 0, 0)

		# pixel_color[0] is R
		# pixel_color[1] is G
		# pixel_color[2] is B

		# if a new color is encountered, print the previous block of color.
		if pixel_color != current_color:

			# if has Red, add to red list
			if pixel_color[0] != 0:
				if row not in list_R:
					list_R.append(row)

			if pixel_color[1] != 0:
				if row not in list_G:
					list_G.append(row)

			if pixel_color[2] != 0:
				if row not in list_B:
					list_B.append(row)

			# if the color changes, write the previous block of color.
			if index != 0 and current_color != (0, 0, 0):
				lucid_lines += "((CounterX >= " + str((offset_x + color_left_bound))
				lucid_lines += ") & (CounterX <= " + str(offset_x + index-1)
				lucid_lines += ")) |"

			# update the left bound
			color_left_bound = index

			# set the current color to the new color
			current_color = pixel_color


		if index == width-1:

			lucid_lines = lucid_lines[:-1]
			
			if current_color != (0, 0, 0):
				lucid_lines += "| ((CounterX >= " + str((offset_x + color_left_bound))
				lucid_lines += ") & (CounterX <= " + str(offset_x + index)
				lucid_lines += "))"

			lucid_lines += ") & ((CounterY == " + str(offset_y + row) + "));"




	print lucid_lines

color_display += "wire R = "

for i in range(0, len(list_R)):
	if i != len(list_R)-1:
		color_display += "line" + str(list_R[i]) + " | "
	else:
		color_display += "line" + str(list_R[i]) + ";\n"

color_display += "wire G = "

for i in range(0, len(list_G)):
	if i != len(list_G)-1:
		color_display += "line" + str(list_G[i]) + " | "
	else:
		color_display += "line" + str(list_G[i]) + ";\n"

color_display += "wire B ="

for i in range(0, len(list_B)):
	if i != len(list_B)-1:
		color_display += "line" + str(list_B[i]) + " | "
	else:
		color_display += "line" + str(list_B[i]) + ";\n"

print color_display