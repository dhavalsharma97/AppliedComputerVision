# Importing the required libraries
import skimage.io as io
import numpy as np

#Converting the image to a numpy array
in_img = io.imread('./data/image1.jpg')
height = in_img.shape[0]
width = in_img.shape[1]

#Initializing the output image
out_img = np.zeros(shape = (20, 20, 3), dtype = np.uint8)

#Function for applying ordered filter for removing noise
def func(x, y, m):
    a = 0
    for i in range(-m // 2, m // 2):
        b = 0
        for j in range(-m // 2, m // 2):
            out_img[a][b] = in_img[x - 1 + i][y - 1 + j]
            b += 1
        a += 1
    return

func(118, 117, 20)

#Printing the output image
print("Output Image:")
io.imshow(out_img)
io.imsave('image1_eye.jpg', out_img)