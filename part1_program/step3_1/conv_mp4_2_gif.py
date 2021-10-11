# This is a python program to convert mp4 to gif.
#
# In order to run this program, you need to have "Python Imaging Library" and "OpenCV" installed.

from PIL import Image, ImageDraw
import cv2
images = []

cap = cv2.VideoCapture('step3_1_wgn.mp4')

while True:
    ret, frame = cap.read()
    if ret:
        img_array = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        im = Image.fromarray(img_array)
        images.append(im)
    else:
        break

images[0].save('step3_1_wgn.gif',
               save_all=True, append_images=images[1:], optimize=False, duration=70, loop=0)

del cap,images

images = []

cap = cv2.VideoCapture('step3_1_pure.mp4')

while True:
    ret, frame = cap.read()
    if ret:
        img_array = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        im = Image.fromarray(img_array)
        images.append(im)
    else:
        break

images[0].save('step3_1_pure.gif',
               save_all=True, append_images=images[1:], optimize=False, duration=70, loop=0)

del cap,images

images = []

cap = cv2.VideoCapture('step3_1_pure_pad.mp4')

while True:
    ret, frame = cap.read()
    if ret:
        img_array = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        im = Image.fromarray(img_array)
        images.append(im)
    else:
        break

images[0].save('step3_1_pure_pad.gif',
               save_all=True, append_images=images[1:], optimize=False, duration=70, loop=0)
