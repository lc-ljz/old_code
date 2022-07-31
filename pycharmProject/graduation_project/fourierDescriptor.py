import cv2
import numpy as np


def fourierDesciptor(res):
    gray_show = cv2.cvtColor(res, cv2.COLOR_BGR2GRAY)

    # 双边滤波，9为区域的直径，后面两个参数是空间高斯函数标准差和灰度值相似性高斯函数标准差
    gray_show = cv2.bilateralFilter(gray_show, 9, 75, 75)

    binary_img = cv2.Canny(gray_show, 50, 200)  # 二值化，canny检测

    # cv2.imshow('Canny', binary_img)

    dst = cv2.Laplacian(binary_img, cv2.CV_16S, ksize=3)
    Laplacian = cv2.convertScaleAbs(dst)  # 将其转回原来的uint8形式

    # cv2.imshow('Laplacian', Laplacian)

    contours, h = cv2.findContours(Laplacian, cv2.RETR_TREE, cv2.CHAIN_APPROX_NONE)  # 寻找轮廓
    if len(contours) == 0:
        print("contours is None")
        return None, None
    contours = max(contours, key=lambda x: cv2.contourArea(x))  # 提取轮廓 contours.shape = (x,1,2)
    ret = np.ones(res.shape, np.uint8)  # 创建黑色幕布
    ret = cv2.drawContours(ret, [contours], -1, (255, 255, 255), 1)  # 绘制白色轮廓

    # import matplotlib.pyplot as plt
    # plt.plot(contours[:, 0, 0], contours[:, 0, 1])
    # plt.show()

    contours_complex = contours[:, 0, 0] + 1j * contours[:, 0, 1]
    fourier_result = np.fft.fft(contours_complex)  # 进行傅里叶变换   # 1维列表

    descriptors_in_use = truncate_descriptor(fourier_result)  # 去高频 -> 圆润
    # black = reconstruct(ret, descriptors_in_use)  # 重建轮廓图

    return ret, descriptors_in_use


def truncate_descriptor(fourier_result):
    descriptors_in_use = np.fft.fftshift(fourier_result)  # 将图像中的低频部分移动到图像的中心

    MIN_DESCRIPTOR = 150

    # 取中间的MIN_DESCRIPTOR项描述子
    center_index = int(len(descriptors_in_use) / 2)
    low, high = center_index - int(MIN_DESCRIPTOR / 2), center_index + int(MIN_DESCRIPTOR / 2)
    descriptors_in_use = descriptors_in_use[low:high]

    descriptors_in_use = np.fft.ifftshift(descriptors_in_use)  # 图像的低频和高频部分移动到图像原来的位置
    return descriptors_in_use


# #由傅里叶描述子重建轮廓图
def reconstruct(img, descriptors_in_use):
    contour_reconstruct = np.fft.ifft(descriptors_in_use)  # 进行傅里叶的逆变化
    contour_reconstruct = np.array([contour_reconstruct.real, contour_reconstruct.imag])
    contour_reconstruct = np.transpose(contour_reconstruct)  # 转置  (32, 2)
    contour_reconstruct = np.expand_dims(contour_reconstruct, axis=1)  # (32, 1, 2)
    if contour_reconstruct.min() < 0:
        contour_reconstruct -= contour_reconstruct.min()
    contour_reconstruct *= img.shape[0] / contour_reconstruct.max()
    contour_reconstruct = contour_reconstruct.astype(np.int32, copy=False)

    black_np = np.ones(img.shape, np.uint8)  # 创建黑色幕布
    black = cv2.drawContours(black_np, contour_reconstruct, -1, (255, 255, 255), 1)  # 绘制白色轮廓
    # cv2.imshow("contour_reconstruct", black)
    # # cv2.imwrite('recover.png',black)
    return black