#importing image
from PIL import Image

#open the image
im = Image.open(r"C:\Users\DELL\Pictures\pics.jpg")

#size of original image
width, height = im.size

#Resizing parameters
left = 4
top = height / 5
right = 154
bottom = 3 * height / 5

#resized image, original image maintained
im1 = im.crop((left, top, right, bottom))
newsize = (300, 300)
im1 = im1.resize(newsize)

#shows the image
im1.show ()



