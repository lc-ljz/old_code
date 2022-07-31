import joblib
import numpy as np
from sklearn import svm, model_selection
import os

path = 'gesture_recognition/hand_feature/'
test_path = "gesture_recognition/test_feature/"
model_path = "model/"


# 读txt文件并将每个文件的描述子改为一维的矩阵存储
def txtToVector(filename, n):
    returnVec = np.zeros((1, n))
    fr = open(filename)
    lineStr = fr.read()
    # print(lineStr.shape)
    lineStr = lineStr.split(' ')
    for i in range(n):
        returnVec[0, i] = int(lineStr[i])
    return returnVec


def tran_SVM_data(n):

    trainingFileList = os.listdir(path + str(0))
    m = len(trainingFileList) * 6  # 图片总数
    training_mat = np.zeros((m, n))

    hw_labels = []  # 存放类别标签

    cla = 0  # 类别
    index = 0
    for i in range(m):
        hw_labels.append(cla)

        training_mat[i, :] = txtToVector(path + str(cla) + '/' + str(index) + '.txt', n)  # 将训练集改为矩阵格式

        index += 1

        if index == 441:
            cla += 1
            index = 0

    return training_mat, hw_labels


def test_SVM_data(n):

    test_num = 1

    m = test_num * 6  # 图片总数
    testing_mat = np.zeros((m, n))

    test_labels = []  # 存放类别标签

    cla = 0  # 类别
    index = 0
    for i in range(m):
        test_labels.append(cla)

        testing_mat[i, :] = txtToVector(path + str(cla) + '/' + str(index) + '.txt', n)  # 将训练集改为矩阵格式

        index += 1

        if index == test_num:
            cla += 1
            index = 0

    return testing_mat, test_labels


def tran_SVM(training_mat, hw_labels):
    svc = svm.SVC()
    # parameters = {'kernel': ('linear', 'rbf'),
    #               'C': [1, 3, 5, 7, 9, 11, 13, 15, 17, 19],
    #               'gamma': [0.00001, 0.0001, 0.001, 0.1, 1, 10, 100, 1000]}  # 预设置一些参数值

    parameters = {'kernel': ('linear', 'rbf'),
                  'C': [3, 5, 7, 9, 11, 13, 15],
                  'gamma': [0.0001, 0.001, 0.1, 1, 10, 100]}  # 预设置一些参数值

    clf = model_selection.GridSearchCV(svc, parameters, cv=5, n_jobs=8)
    clf.fit(training_mat, hw_labels)
    # print(clf.return_train_score)
    print(clf.best_params_)  # 打印出最好的结果
    # print(clf.best_score_)

    # classifier = svm.SVC(C=2, kernel='rbf', gamma=10, decision_function_shape='ovr')
    # classifier.fit(training_mat, hw_labels)
    # return classifier
    return clf


# ###训练 + 验证#####
if __name__ == "__main__":
    trainingMat, hwLabels = tran_SVM_data(149)
    testingMat, testLabels = test_SVM_data(149)
    classifier = tran_SVM(trainingMat, hwLabels)
    # print("测试集：", classifier.score(testingMat, testLabels))
    # print(classifier.predict(testingMat))
    save_path = model_path + "train_model.m"
    joblib.dump(classifier, save_path)  # 保存最好的模型

    # a = np.array([[100, 178, 26, 7, 20, 25, 10, 6, 4, 3, 3, 3, 2, 0, 0, 3, 3, 1, 2, 1, 0, 0, 1, 1, 0, 1, 0, 0,
    #                1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    #                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    #                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    #                0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 2, 0, 1, 0, 0, 2, 1, 2, 4, 1, 1, 1, 4, 4, 5,
    #                2, 6, 9, 27, 19, 8, 30, 182, 112]])
    # print(classifier.predict(a))
