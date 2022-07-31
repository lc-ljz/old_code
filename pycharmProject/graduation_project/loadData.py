# 计算手势库的特征

import fourierDescriptor as fd
import cv2


path = 'gesture_recognition/hand_feature' + '/'  # 特征
path_img = 'gesture_recognition/hand_image' + '/'   # 图片

if __name__ == "__main__":
    for i in range(0, 6):
        for j in range(0, 441):
            roi = cv2.imread(path_img + str(i) + '/' + str(j) + '.png')

            _, descirptor_in_use = fd.fourierDesciptor(roi)

            descirptor_in_use = abs(descirptor_in_use)

            fd_name = path + str(i) + '/' + str(j) + '.txt'
            # fd_name = path + str(i) + '.txt'
            with open(fd_name, 'w', encoding='utf-8') as f:
                temp = descirptor_in_use[1]
                for k in range(1, len(descirptor_in_use)):
                    x_record = int(100 * descirptor_in_use[k] / temp)
                    f.write(str(x_record))
                    f.write(' ')
                f.write('\n')
            print(i, '_', j, '完成')