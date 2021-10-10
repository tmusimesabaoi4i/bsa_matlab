# This is a python program to convert mp4 to gif.
#
# In order to run this program, you need to have "Python Imaging Library" and "OpenCV" installed.

from PIL import Image, ImageDraw
import cv2

def convmp4_2_gif(file) :
    images = []
    cap = cv2.VideoCapture(file + '.mp4')

    while True:
        ret, frame = cap.read()
        if ret:
            img_array = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            im = Image.fromarray(img_array)
            images.append(im)
        else:
            break

    images[0].save(file + '.gif',
                   save_all=True, append_images=images[1:], optimize=False, duration=70, loop=0)

    del cap,images

convmp4_2_gif('v1_pure')
convmp4_2_gif('v1_wgn')
convmp4_2_gif('v1_pad_pure')
convmp4_2_gif('v1_pad_wgn')
convmp4_2_gif('v2_pure')
convmp4_2_gif('v2_wgn')
convmp4_2_gif('v2_pad_pure')
convmp4_2_gif('v2_pad_wgn')
