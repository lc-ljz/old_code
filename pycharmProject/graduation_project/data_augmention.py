# 建立特征库
# 数据扩充 从21-440

import random
import cv2
import numpy as np

path = 'gesture_recognition/hand_image/'


# 旋转
def rotate(image, scale=0.9):
    angle = random.randrange(-90, 90)  # 随机角度
    w = image.shape[1]
    h = image.shape[0]
    # rotate matrix
    M = cv2.getRotationMatrix2D((w / 2, h / 2), angle, scale)
    # rotate
    image = cv2.warpAffine(image, M, (w, h))
    return image


def add_noise(image):
    for _ in range(10):  # 添加点噪声

        temp_x = np.random.randint(0, image.shape[0])
        temp_y = np.random.randint(0, image.shape[1])
        image[temp_x][temp_y] = 255
    return image


def add_erode(img):
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
    # 返回指定形状和尺寸的结构元素，这里是矩形
    img = cv2.erode(img, kernel)  # 腐蚀,把图片变瘦
    return img


def add_dilate(img):
    kernel = cv2.getStructuringElement(cv2.MORPH_RECT, (3, 3))
    img = cv2.dilate(img, kernel)  # 图像膨胀
    return img


def do(im):
    # a = random.random()
    # if a > 0.66:
    #     im = add_noise(im)
    # if 0.66 > a > 0.33:
    #     im = add_dilate(im)
    # if a < 0.33:
    #     im = add_erode(im)

    if random.random() > 0.5:
        im = add_noise(im)
    if random.random() > 0.5:
        im = add_dilate(im)
    if random.random() > 0.5:
        im = add_erode(im)

    return im


if __name__ == "__main__":
    for i in range(0, 6):

        cnt = 21  # 计数
        for j in range(0, 21):
            roi = cv2.imread(path + str(i) + '/' + str(j) + '.png')
            # print(path1 + str(i) + '/' + str(j) + '.png')
            for k in range(10):
                img_rotation = rotate(roi)  # 旋转
                # do(img_rotation)
                cv2.imwrite(path + str(i) + '/' + str(cnt) + '.png', img_rotation)
                cnt += 1
                img_flip = cv2.flip(img_rotation, 1)  # 翻转
                # do(img_flip)
                cv2.imwrite(path + str(i) + '/' + str(cnt) + '.png', img_flip)
                cnt += 1
            print(i, '_', j, '完成')
