import PIL.Image
import qtawesome
from PIL import ImageFilter
from PIL.ImageDraw import ImageDraw
from PyQt5 import QtWidgets, QtGui, QtCore
import sys
import os
import mutagen
from PyQt5.QtWidgets import QMessageBox
from mutagen.mp3 import MP3
import pygame
import pickle
import cv2
import numpy as np
from functools import partial
import joblib
from fourierDescriptor import reconstruct, fourierDesciptor

pygame.init()


class MainUi(QtWidgets.QMainWindow):
    def __init__(self):
        super().__init__()

        # UI设置
        self.setFixedSize(1055, 708)  # 设置大小
        self.setWindowTitle('音乐播放器')  # 设置标题
        self.setWindowIcon(QtGui.QIcon('picture/icon.ico'))  # 设置图标

        # 创建主部件
        self.main_widget = QtWidgets.QWidget(self)
        self.main_widget.setMaximumSize(QtCore.QSize(16777211, 16777215))
        self.main_widget.setObjectName("main_widget")

        # 创建顶部部件
        self.top_widget = QtWidgets.QWidget(self.main_widget)
        self.top_widget.setGeometry(QtCore.QRect(0, 0, 1051, 31))
        self.top_widget.setObjectName("top_widget")

        self.pushButton_setting = QtWidgets.QPushButton(self.top_widget)
        self.pushButton_setting.setGeometry(QtCore.QRect(20, 0, 40, 29))
        self.pushButton_setting.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        icon_setting = QtGui.QIcon()
        icon_setting.addPixmap(QtGui.QPixmap("picture/setting.ico"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.pushButton_setting.setIcon(icon_setting)
        self.pushButton_setting.setObjectName("pushButton_setting")

        self.new_widow_setting = SecondWindow()
        self.pushButton_setting.clicked.connect(self.setting)

        # self.pushButton_user = QtWidgets.QPushButton(self.top_widget)
        # self.pushButton_user.setGeometry(QtCore.QRect(90, 0, 40, 29))
        # self.pushButton_user.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        # icon_user = QtGui.QIcon()
        # icon_user.addPixmap(QtGui.QPixmap("picture/user.ico"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        # self.pushButton_user.setIcon(icon_user)
        # self.pushButton_user.setObjectName("pushButton_user")

        # 搜索
        self.search_icon = QtWidgets.QPushButton(self.top_widget)
        self.search_icon.setText(chr(0xf002) + ' ' + '本地搜索 ')
        self.search_icon.setFont(qtawesome.font('fa', 16))
        self.search_icon.setGeometry(QtCore.QRect(160, 0, 90, 29))
        self.search_icon.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.search_icon.setObjectName("search_icon")

        # 搜索框
        self.lineEdit = QtWidgets.QLineEdit(self.top_widget)
        self.lineEdit.setGeometry(QtCore.QRect(270, 0, 255, 29))
        self.lineEdit.setPlaceholderText("输入歌曲名称")
        self.lineEdit.setObjectName("lineEdit")

        self.search_icon.clicked.connect(self.search_icon_music)

        # 创建左上侧部件
        self.left_top_widget = QtWidgets.QWidget(self.main_widget)  # 创建左侧部件
        self.left_top_widget.setEnabled(True)
        self.left_top_widget.setGeometry(QtCore.QRect(-1, 29, 131, 371))
        self.left_top_widget.setAutoFillBackground(False)
        self.left_top_widget.setObjectName('left_top_widget')

        # 创建中上部部件
        self.middle_top_widget = QtWidgets.QWidget(self.main_widget)  # 创建右侧部件
        self.middle_top_widget.setGeometry(QtCore.QRect(129, 29, 611, 371))
        self.middle_top_widget.setObjectName("middle_top_widget")

        # 中上部件2
        self.middle_top_widget2 = QtWidgets.QWidget(self.main_widget)
        self.middle_top_widget2.setGeometry(QtCore.QRect(129, 29, 611, 371))
        self.middle_top_widget2.setObjectName("middle_top_widget2")
        self.middle_top_widget2.setVisible(False)
        self.middle_top_widget2.setEnabled(False)

        self.list_music_label = QtWidgets.QLabel(self.middle_top_widget2)
        self.list_music_label.setGeometry(QtCore.QRect(10, 20, 155, 35))

        # file = os.listdir('data/album_list')
        # self.list_music_now = len(file)  # 现有的歌单数
        # self.list_music_max = 6  # 总共支持最多6个歌单

        recommend_1_text = "我喜欢"
        self.recommend_button_1 = QtWidgets.QToolButton(self.middle_top_widget2)
        self.recommend_button_1.setGeometry(QtCore.QRect(60, 60, 145, 145))
        self.recommend_button_1.setText(recommend_1_text)  # 设置按钮文本
        self.recommend_button_1.setIcon(QtGui.QIcon('album-picture/0.jpg'))  # 设置按钮图标
        self.recommend_button_1.setIconSize(QtCore.QSize(120, 120))  # 设置图标大小
        self.recommend_button_1.setToolButtonStyle(QtCore.Qt.ToolButtonTextUnderIcon)  # 设置按钮形式为上图下文
        self.recommend_love = reader_file('data/album_list/recommend_love.pickle')
        self.recommend_button_1.clicked.connect(partial(self.recommend_show, self.recommend_love, recommend_1_text))

        recommend_2_text = "默认歌单"
        self.recommend_button_2 = QtWidgets.QToolButton(self.middle_top_widget2)
        self.recommend_button_2.setGeometry(QtCore.QRect(265, 60, 145, 150))
        self.recommend_button_2.setText(recommend_2_text)  # 设置按钮文本
        self.recommend_button_2.setIcon(QtGui.QIcon('album-picture/1.jpg'))  # 设置按钮图标
        self.recommend_button_2.setIconSize(QtCore.QSize(125, 125))  # 设置图标大小
        self.recommend_button_2.setToolButtonStyle(QtCore.Qt.ToolButtonTextUnderIcon)  # 设置按钮形式为上图下文
        self.recommend_local = reader_file('data/album_list/recommend_local.pickle')
        self.recommend_button_2.clicked.connect(partial(self.recommend_show, self.recommend_local, recommend_2_text))

        # self.recommend_3_text = "歌单2"
        # self.recommend_button_3 = QtWidgets.QToolButton(self.middle_top_widget2)
        # self.recommend_button_3.setGeometry(QtCore.QRect(455, 60, 145, 150))
        # self.recommend_button_3.setText(self.recommend_3_text)  # 设置按钮文本
        # self.recommend_button_3.setIcon(QtGui.QIcon('album-picture/2.jpg'))  # 设置按钮图标
        # self.recommend_button_3.setIconSize(QtCore.QSize(125, 125))  # 设置图标大小
        # self.recommend_button_3.setToolButtonStyle(QtCore.Qt.ToolButtonTextUnderIcon)  # 设置按钮形式为上图下文
        # self.recommend_3 = read('data/album_list/recommend_3.pickle')
        # self.recommend_button_3.clicked.connect(partial(self.recommend_show, self.recommend_3_text))
        #
        # self.recommend_4_text = "歌单3"
        # self.recommend_button_4 = QtWidgets.QToolButton(self.middle_top_widget2)
        # self.recommend_button_4.setGeometry(QtCore.QRect(60, 210, 145, 145))
        # self.recommend_button_4.setText(self.recommend_4_text)  # 设置按钮文本
        # self.recommend_button_4.setIcon(QtGui.QIcon('album-picture/3.jpg'))  # 设置按钮图标
        # self.recommend_button_4.setIconSize(QtCore.QSize(120, 120))  # 设置图标大小
        # self.recommend_button_4.setToolButtonStyle(QtCore.Qt.ToolButtonTextUnderIcon)  # 设置按钮形式为上图下文
        # self.recommend_4 = read('data/album_list/recommend_4.pickle')
        # self.recommend_button_4.clicked.connect(partial(self.recommend_show, self.recommend_4_text))
        #
        # self.recommend_5_text = "歌单4"
        # self.recommend_button_5 = QtWidgets.QToolButton(self.middle_top_widget2)
        # self.recommend_button_5.setGeometry(QtCore.QRect(265, 210, 145, 150))
        # self.recommend_button_5.setText(self.recommend_5_text)  # 设置按钮文本
        # self.recommend_button_5.setIcon(QtGui.QIcon('album-picture/4.jpg'))  # 设置按钮图标
        # self.recommend_button_5.setIconSize(QtCore.QSize(125, 125))  # 设置图标大小
        # self.recommend_button_5.setToolButtonStyle(QtCore.Qt.ToolButtonTextUnderIcon)  # 设置按钮形式为上图下文
        # self.recommend_5 = read('data/album_list/recommend_5.pickle')
        # self.recommend_button_5.clicked.connect(partial(self.recommend_show, self.recommend_5_text))
        #
        # self.recommend_6_text = "歌单5"
        # self.recommend_button_6 = QtWidgets.QToolButton(self.middle_top_widget2)
        # self.recommend_button_6.setGeometry(QtCore.QRect(455, 210, 145, 150))
        # self.recommend_button_6.setText(self.recommend_6_text)  # 设置按钮文本
        # self.recommend_button_6.setIcon(QtGui.QIcon('album-picture/5.jpg'))  # 设置按钮图标
        # self.recommend_button_6.setIconSize(QtCore.QSize(125, 125))  # 设置图标大小
        # self.recommend_button_6.setToolButtonStyle(QtCore.Qt.ToolButtonTextUnderIcon)  # 设置按钮形式为上图下文
        # self.recommend_6 = read('data/album_list/recommend_5.pickle')
        # self.recommend_button_6.clicked.connect(partial(self.recommend_show, self.recommend_6_text))

        # 创建右上部部件
        self.right_top_widget = QtWidgets.QWidget(self.main_widget)
        self.right_top_widget.setGeometry(QtCore.QRect(739, 29, 311, 371))
        self.right_top_widget.setObjectName("right_top_widget")

        # 创建底部
        self.bottom_widget = QtWidgets.QWidget(self.main_widget)
        self.bottom_widget.setGeometry(QtCore.QRect(0, 390, 1051, 61))
        self.bottom_widget.setObjectName("bottom_widget")

        # 图片
        self.console_picture = QtWidgets.QLabel(self.bottom_widget)
        self.console_picture.setGeometry(QtCore.QRect(10, 10, 50, 50))
        # p = QtGui.QPixmap('music-picture/1.jpg')
        # print(type(p))
        p = PIL.Image.open('music-picture/0.jpg')
        p = circle_image(p)
        p = p.convert("RGBA")
        data = p.tobytes("raw", "RGBA")
        p = QtGui.QImage(data, p.size[0], p.size[1], QtGui.QImage.Format_ARGB32)

        self.console_picture.setPixmap(QtGui.QPixmap.fromImage(p))
        self.console_picture.setScaledContents(True)

        # 音乐控制部件
        self.console_button_backward = QtWidgets.QPushButton(self.bottom_widget)
        self.console_button_backward.setGeometry(QtCore.QRect(590, 0, 65, 52))
        self.console_button_backward.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.console_button_backward.setIcon(QtGui.QIcon("picture/previous_button.ico"))
        self.console_button_backward.setIconSize(QtCore.QSize(40, 40))
        self.console_button_backward.setObjectName("console_button_backward")

        self.console_button_pause = QtWidgets.QPushButton(self.bottom_widget)
        self.console_button_pause.setGeometry(QtCore.QRect(650, 0, 65, 52))
        self.console_button_pause.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.console_button_pause.setIcon(QtGui.QIcon("picture/play_button.ico"))
        self.console_button_pause.setIconSize(QtCore.QSize(40, 40))
        self.console_button_pause.setObjectName("console_button_pause")

        self.console_button_forward = QtWidgets.QPushButton(self.bottom_widget)
        self.console_button_forward.setGeometry(QtCore.QRect(710, 0, 65, 52))
        self.console_button_forward.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.console_button_forward.setIcon(QtGui.QIcon("picture/next_button.ico"))
        self.console_button_forward.setIconSize(QtCore.QSize(40, 40))
        self.console_button_forward.setObjectName("console_button_forward")

        # 按钮不可用
        self.console_button_pause.setEnabled(False)
        self.console_button_forward.setEnabled(False)
        self.console_button_backward.setEnabled(False)

        # 按钮绑定功能
        self.console_button_pause.clicked.connect(self.local_music_play_pause)
        self.console_button_forward.clicked.connect(self.local_music_forward)
        self.console_button_backward.clicked.connect(self.local_music_backward)

        # 进度条
        self.progressBar = QtWidgets.QProgressBar(self.bottom_widget)
        self.progressBar.setGeometry(QtCore.QRect(100, 30, 400, 5))
        self.progressBar.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.progressBar.setObjectName("progressBar")
        self.progressBar.setTextVisible(False)

        # 进度条信息
        self.progressBar_now = QtWidgets.QLabel(self.bottom_widget)
        self.progressBar_now.setGeometry(QtCore.QRect(65, 28, 40, 15))
        self.progressBar_now.setText('00:00')
        self.progressBar_now.setObjectName('progressBar_now_all')

        self.progressBar_all = QtWidgets.QLabel(self.bottom_widget)
        self.progressBar_all.setGeometry(QtCore.QRect(505, 28, 40, 15))
        self.progressBar_all.setText('00:00')
        self.progressBar_all.setObjectName('progressBar_now_all')

        # 歌曲信息
        self.progressBar_music_title = QtWidgets.QLabel(self.bottom_widget)
        self.progressBar_music_title.setGeometry(QtCore.QRect(180, 3, 180, 35))

        # 音量
        self.volume_control = QtWidgets.QSlider(self.bottom_widget)
        self.volume_control.setGeometry(QtCore.QRect(850, 22, 160, 20))
        # self.volume_control.setProperty("value", 27)
        self.volume_control.setOrientation(QtCore.Qt.Horizontal)
        self.volume_control.setObjectName("volume_control")
        self.volume_control.setRange(0, 100)
        self.volume_play = 50
        self.volume_control.setValue(self.volume_play)
        self.volume_control.setSingleStep(5)

        # 静音/有声音
        self.volume = QtWidgets.QPushButton(self.bottom_widget)
        self.volume.setGeometry(QtCore.QRect(790, 17, 61, 31))
        self.volume.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        icon8 = QtGui.QIcon()
        icon8.addPixmap(QtGui.QPixmap("picture/volume_play.ico"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.volume.setIcon(icon8)
        self.volume.setIconSize(QtCore.QSize(30, 30))
        self.volume.setObjectName("volume")
        self.volume.clicked.connect(self.volume_mute)

        # 左下部件
        self.left_bottom_widget = QtWidgets.QWidget(self.main_widget)
        self.left_bottom_widget.setGeometry(QtCore.QRect(0, 450, 381, 255))
        self.left_bottom_widget.setObjectName("left_bottom_widget")

        # 中下部件
        self.middle_bottom_widget = QtWidgets.QWidget(self.main_widget)
        self.middle_bottom_widget.setGeometry(QtCore.QRect(379, 449, 300, 255))
        self.middle_bottom_widget.setObjectName("middle_bottom_widget")

        # 右下部件
        self.right_bottom_widget = QtWidgets.QWidget(self.main_widget)
        self.right_bottom_widget.setGeometry(QtCore.QRect(678, 449, 372, 255))
        self.right_bottom_widget.setObjectName("right_bottom_widget")

        # 歌单
        self.list_music = QtWidgets.QPushButton(self.left_top_widget)
        self.list_music.setGeometry(QtCore.QRect(0, 60, 128, 40))
        self.list_music.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.list_music.setAutoFillBackground(False)
        self.list_music.setIcon(QtGui.QIcon("picture/easy.ico"))
        self.list_music.setText('我的歌单')
        self.list_music.setObjectName("list_music")

        self.list_music.clicked.connect(self.music_list_show)

        # 本地历史
        self.history_music = QtWidgets.QPushButton(self.left_top_widget)
        self.history_music.setGeometry(QtCore.QRect(0, 110, 128, 40))
        self.history_music.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.history_music.setAutoFillBackground(False)
        self.history_music.setIcon(QtGui.QIcon("picture/history.ico"))
        self.history_music.setObjectName("history")
        self.history_music.setText('最近播放')

        self.history_music_index = []

        self.history_music.clicked.connect(self.history_music_show)

        # 本地音乐
        self.local_music = QtWidgets.QPushButton(self.left_top_widget)
        self.local_music.setGeometry(QtCore.QRect(0, 160, 128, 40))
        self.local_music.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.local_music.setAutoFillBackground(False)
        self.local_music.setIcon(QtGui.QIcon("picture/menu.ico"))
        self.local_music.setObjectName("local")
        self.local_music.setText('本地音乐')

        ################################################################
        # 获取相关信息

        # local_table
        self.table_widget = QtWidgets.QTableWidget(self.middle_top_widget)  # 显示表格
        self.table_widget.setGeometry(QtCore.QRect(0, 100, 611, 260))
        self.table_widget.setShowGrid(False)  # 不显示表格
        self.table_widget.verticalHeader().setVisible(False)  # 表头不显示
        # self.table_widget.horizontalHeader().setVisible(False)  # 表头不显示(横)
        self.table_widget.horizontalHeader().setSectionResizeMode(QtWidgets.QHeaderView.Stretch)  # 自适应
        self.table_widget.resizeRowsToContents()
        self.table_widget.resizeColumnsToContents()
        self.table_widget.horizontalHeader().setSectionsClickable(False)
        self.table_widget.setFocusPolicy(QtCore.Qt.NoFocus)  # 去除选中虚线框
        self.table_widget.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectRows)  # 设置只有行选中, 整行选中 transparent
        self.table_widget.setSelectionMode(QtWidgets.QAbstractItemView.SingleSelection)  # 只能选中单行
        # self.table_widget.alternatingRowColors()  # 各行变色
        self.table_widget.clicked.connect(self.table_widget_click)
        self.table_widget.doubleClicked.connect(self.table_widget_doubleclick)

        self.table_widget.setContextMenuPolicy(QtCore.Qt.CustomContextMenu)  # 允许弹出菜单
        self.table_widget.customContextMenuRequested.connect(self.local_show_menu)  # 右击菜单

        self.table_widget.horizontalHeader().setStyleSheet('''QHeaderView::section{
                                                                    border:none;
                                                                    font: 15pt '华文隶书';
                                                                    background-color: rgb(228, 255, 203);
                                                                }''')
        self.table_widget.verticalScrollBar().setStyleSheet('''QScrollBar{
                                                                    background-color: rgb(228, 255, 203);
                                                                    width:12px;
                                                                    padding-top:20px;      
                                                                    padding-bottom:20px;
                                                                }
                                                                QScrollBar::handle{  
                                                                    border-radius:5px;
                                                                    background-color:rgb(102, 102, 102);
                                                                }
                                                                QScrollBar::handle:hover{  
                                                                    border-radius:6px;
                                                                    background-color:rgb(110, 110, 110);
                                                                }
                                                                QScrollBar::add-line , QScrollBar::sub-line{
                                                                    background-color: rgb(228, 255, 203);
                                                                    border:None;
                                                                }
                                                                QScrollBar::add-page, QScrollBar::sub-page{
                                                                    background: none;
                                                                }
                                                                ''')

        # self.table_widget.itemSelectionChanged.connect(self.table_widget_changed)

        # Label
        self.show_label_info = QtWidgets.QLabel(self.middle_top_widget)
        self.show_label_info.setGeometry(QtCore.QRect(20, 20, 150, 30))
        self.show_label_info.setObjectName("show_label_info")

        # 本地音乐
        self.console_button_control = 0  # 播放按钮无效的判断

        self.local_music_file = {}  # 所有的本地音乐
        self.local_music_file_info = {}
        self.playing = 0  # 是否正在播放
        self.song_index = -1  # 正在播放的音乐编号，-1为未播放
        self.local_music_get()  # 获取所有的本地音乐
        self.song_number = len(self.local_music_file)  # 所有的本地音乐的数量
        self.local_music.clicked.connect(self.local_music_show)  # 显示所有的本地音乐

        self.local_music_show()  # 界面一打开就显示本地音乐

        # 播放进度
        self.progressbar_timer_bar = QtCore.QTimer()  # 计时器
        self.progressbar_timer_bar.timeout.connect(self.process_bar_music)
        self.progressbar_step = 0

        # 音量
        self.volume_timer_bar = QtCore.QTimer()  # 计时器
        self.volume_timer_bar.timeout.connect(self.volume_bar_music)

        # 歌词

        self.icon_arrow_forward_right = QtGui.QIcon()  # 右图标
        self.icon_arrow_forward_right.addPixmap(QtGui.QPixmap("picture/arrow_forward_right.ico"), QtGui.QIcon.Normal,
                                                QtGui.QIcon.Off)

        self.icon_arrow_back_left = QtGui.QIcon()  # 左图标
        self.icon_arrow_back_left.addPixmap(QtGui.QPixmap("picture/arrow_back_left.ico"), QtGui.QIcon.Normal, QtGui.
                                            QIcon.Off)

        self.lyric_display_frame1 = QtWidgets.QFrame(self.right_top_widget)
        self.lyric_display_frame1.setObjectName('left_frame')
        self.lyric_display_frame1.setGeometry(QtCore.QRect(0, 0, 311, 371))

        self.lyric_display_frame2 = QtWidgets.QFrame(self.right_top_widget)
        self.lyric_display_frame2.setObjectName('right_frame')
        self.lyric_display_frame2.setEnabled(False)
        self.lyric_display_frame2.setVisible(False)

        self.lyric_display_part = QtWidgets.QPushButton(self.right_top_widget)  # 按钮
        self.lyric_display_part.setGeometry(QtCore.QRect(280, 150, 25, 35))
        self.lyric_display_part.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        self.lyric_display_part.setIcon(self.icon_arrow_forward_right)
        self.lyric_display_part_right = 1
        self.lyric_display_part.clicked.connect(self.lyric_display_part_dis)
        # Label歌词
        self.lyric_display_partTop = QtWidgets.QLabel(self.right_top_widget)
        self.lyric_display_partTop.setGeometry(QtCore.QRect(0, 0, 311, 20))
        self.lyric_display_partTop.setAlignment(QtCore.Qt.AlignCenter)
        self.lyric_display_partTop.setObjectName('lyric_display_partTop')
        self.lyric_display_partTop.setText("")

        self.lyric_display_partU1 = QtWidgets.QLabel(self.lyric_display_frame2)
        self.lyric_display_partU1.setGeometry(QtCore.QRect(0, 90, 311, 20))
        self.lyric_display_partU1.setAlignment(QtCore.Qt.AlignCenter)
        self.lyric_display_partU1.setText("")

        self.lyric_display_partU2 = QtWidgets.QLabel(self.lyric_display_frame2)
        self.lyric_display_partU2.setGeometry(QtCore.QRect(0, 130, 311, 20))
        self.lyric_display_partU2.setAlignment(QtCore.Qt.AlignCenter)
        self.lyric_display_partU2.setText("")

        self.lyric_display_partCenter = QtWidgets.QLabel(self.lyric_display_frame2)
        self.lyric_display_partCenter.setGeometry(QtCore.QRect(0, 170, 311, 20))
        self.lyric_display_partCenter.setAlignment(QtCore.Qt.AlignCenter)
        self.lyric_display_partCenter.setObjectName('display_partCenter')
        self.lyric_display_partCenter.setText("暂无歌词")

        self.lyric_display_partD1 = QtWidgets.QLabel(self.lyric_display_frame2)
        self.lyric_display_partD1.setGeometry(QtCore.QRect(0, 210, 311, 20))
        self.lyric_display_partD1.setAlignment(QtCore.Qt.AlignCenter)
        self.lyric_display_partD1.setText("")

        self.lyric_display_partD2 = QtWidgets.QLabel(self.lyric_display_frame2)
        self.lyric_display_partD2.setGeometry(QtCore.QRect(0, 250, 311, 20))
        self.lyric_display_partD2.setAlignment(QtCore.Qt.AlignCenter)
        self.lyric_display_partD2.setText("")
        # ################################################

        self.lyric_display_part_picture = QtWidgets.QLabel(self.lyric_display_frame1)
        self.lyric_display_part_picture.setGeometry(QtCore.QRect(0, 80, 311, 200))
        self.lyric_display_part_picture.setAlignment(QtCore.Qt.AlignCenter)

        p = PIL.Image.open('music-picture/0.jpg')
        p = circle_image(p, 200)
        p = p.convert("RGBA")
        data = p.tobytes("raw", "RGBA")
        p = QtGui.QImage(data, p.size[0], p.size[1], QtGui.QImage.Format_ARGB32)
        self.lyric_display_part_picture.setPixmap(QtGui.QPixmap.fromImage(p))

        self.lyric_display_partD3 = QtWidgets.QLabel(self.lyric_display_frame1)
        self.lyric_display_partD3.setGeometry(QtCore.QRect(0, 290, 311, 20))
        self.lyric_display_partD3.setAlignment(QtCore.Qt.AlignCenter)
        self.lyric_display_partD3.setWordWrap(True)

        self.lyric_display_partD4 = QtWidgets.QLabel(self.lyric_display_frame1)
        self.lyric_display_partD4.setGeometry(QtCore.QRect(0, 320, 311, 20))
        self.lyric_display_partD4.setAlignment(QtCore.Qt.AlignCenter)
        self.lyric_display_partD4.setObjectName("lyric_display_partD4")
        self.lyric_display_partD4.setText("暂无歌词")
        self.lyric_display_partD4.setWordWrap(True)

        self.lyric_timer_bar = QtCore.QTimer()
        self.lyric_timer_bar.timeout.connect(self.lyric_show)
        self.lrc_dict = {}
        self.lrc_step = 0

        # # 摄像头
        # self.label_show_camera_left = QtWidgets.QLabel(self.left_bottom_widget)
        # self.label_show_camera_right = QtWidgets.QLabel(self.middle_bottom_widget)
        # self.label_show_camera_left.setGeometry(QtCore.QRect(0, 0, 381, 255))
        # self.label_show_camera_right.setGeometry(QtCore.QRect(0, 0, 300, 255))
        #
        # self.model = joblib.load("model/train_model.m")
        #
        # self.camera_timer = QtCore.QTimer()  # 摄像头定时器
        # self.cap = cv2.VideoCapture(0, cv2.CAP_DSHOW)
        # self.label_show_camera_left.setAlignment(QtCore.Qt.AlignTop)
        # self.label_show_camera_left.setAlignment(QtCore.Qt.AlignLeft)
        # self.show_camera1()
        # self.camera_timer.timeout.connect(self.show_camera2)
        #
        # # 显示figure
        # self.figure = 0
        # self.fig_label = QtWidgets.QLabel(self.right_bottom_widget)
        # self.fig_label.setGeometry(QtCore.QRect(0, 0, 372, 255))
        # self.fig_label.setAlignment(QtCore.Qt.AlignCenter)
        # self.fig_label.setText(str(self.figure))
        # self.fig_label.setObjectName("fig_label")
        #
        # self.figure_timer = QtCore.QTimer()  # figure显示定时器
        # self.figure_timer.start(3000)
        # self.figure_timer.timeout.connect(self.show_fig_label)
        #
        # # 按钮
        # # self.fig_button = QtWidgets.QPushButton(self.right_bottom_widget)
        # # self.fig_button.setGeometry(QtCore.QRect(15, 15, 60, 40))
        # # self.fig_button.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
        # # self.fig_button.setText('确定')
        # # self.fig_button.setObjectName("fig_button")

        ############################################################
        #############################################################
        # QSS
        # solid:实线，dotted:点线，dashed:虚线，double：双线
        # rgb(226, 255, 179) 背景

        self.top_widget.setStyleSheet('''
                QWidget#top_widget{
                    background-color: rgb(226, 255, 179);
                    border-bottom:2px solid rgb(226, 255, 175)
                }
                QLineEdit{
                    background-color: rgb(226, 255, 179);
                    border:1px solid gray;
                    width:300px;
                    border-radius:10px;
                    padding:2px 4px;
                }
                QPushButton{
                    background-color: rgb(226, 255, 179);
                    border:none;
                    color:black;
                    font-size:15px;
                    font-weight:700;
                    font:'宋体';
                }
                QPushButton:hover{
                    border:1px solid #F3F3F5;
                    color:black;
                    border-radius:10px;
                    border-bottom-color: rgb(0, 0, 255);
                    font-size:16px;
                    font-weight:700;
                }
        ''')

        # rgb(66, 66, 66)
        self.left_top_widget.setStyleSheet('''
                QWidget#left_top_widget{
                    background-color: rgb(228, 255, 203);
                    border-right:2px solid rgb(80, 80, 80);
                }
                QPushButton{
                    border:none;
                    color:black;
                    font-size:15px;
                    text-align:left;
                    height:40px;
                    padding-left:5px;
                    padding-right:10px;
                    font-weight:700;
                    border-radius:10px;
                    background:rgb(228, 255, 203);
                }
                QPushButton:hover{
                    color:white;
                    border:1px solid #F3F3F5;
                    border-radius:10px;
                    background-color: lightGray;
                }
                QPushButton:pressed{
                    border:1px solid #F3F3F5;
                }
        ''')
        # QTableWidget::item: hover{ border - radius: 10px;}
        self.middle_top_widget.setStyleSheet('''
                QWidget#middle_top_widget{
                    background-color: rgb(228, 255, 203);
                }
                QTableWidget{
                    border:None;
                    border-top:1px dashed lightGray;
                    background-color: rgb(228, 255, 203);
                    selection-background-color: rgb(228, 255, 203);
                }
                QLabel#show_label_info{
                    color:black;
                    font: 20pt '宋体';
                }
                QLabel{
                    color:black;
                    font: 10pt '仿宋';
                    border-top:1px dashed lightGray;
                }
                QLabel:hover{
                    color:gray;
                    font: 15pt '宋体';
                    border-top:1px dashed lightGray;
                }
        ''')

        self.middle_top_widget2.setStyleSheet('''
                QWidget#middle_top_widget2{
                    background-color: rgb(228, 255, 203);
                }
                QLabel{
                    color:black;
                    font: 15pt '仿宋';
                }
                QToolButton{
                    border:None;
                    background-color: rgb(228, 255, 203);
                }
        ''')

        #     QFrame # left_frame{ background: white; }
        #     QFrame # right_frame{ background: black; }
        self.right_top_widget.setStyleSheet('''
                QWidget#right_top_widget{
                    background:rgb(228, 255, 203);
                    border-left:1px solid rgb(80, 80, 80);
                }
                QPushButton{
                    border:none;
                    border-radius:5px;
                }
                QLabel{
                    font: 15px '微软雅黑';
                }
                QLabel#lyric_display_partTop{
                    font: 17px '微软雅黑';
                }
                 QLabel#display_partCenter{
                    font: 17px '微软雅黑';
                    color:blue;
                }
                QLabel#lyric_display_partD4{
                    font: 17px '微软雅黑';
                    color:blue;
                }
        ''')

        self.bottom_widget.setStyleSheet('''
                QWidget#bottom_widget{
                    background-color: white;
                }
                QPushButton{
                    background-color: white;
                    border:none;
                }
                QPushButton:hover{
                    border:1px solid #F3F3F5;
                    border-radius:10px;
                }
                QSlider{
                    background-color: white;
                    border:none;
                    border-radius: 8px;
                }
                QProgressBar#progressBar{
                    border:none;
                    border-radius:2px;
                    background-color:lightGray;
                    height:5px;
                } 
                QLabel{
                    color:black;
                    font: 15px '仿宋';
                }
                QLabel#progressBar_now_all{
                    color:black;
                    font: 11px '仿宋';
                }
        ''')

        self.right_bottom_widget.setStyleSheet('''
                QWidget#right_bottom_widget{
                    background-color: rgb(0, 170, 127);
                }
                QLabel#fig_label{
                    color:blue;
                    font: 43pt '仿宋';
                }
                QPushButton#fig_button{
                    color:black;
                    font: 10pt '仿宋';
                    background-color: lightGray;
                    border:1px;
                    border-radius:5px;
                }
                QPushButton#fig_button:pressed{
                    color:white;
                    font: 10pt '仿宋';
                    background-color: gray;
                }
        ''')

        self.setCentralWidget(self.main_widget)

    def table_widget_click(self):
        r = self.table_widget.currentRow()
        c = self.table_widget.currentColumn()
        content = str(self.table_widget.cellWidget(r, c).text())
        print('单击：' + content)

    def table_widget_doubleclick(self):
        r = self.table_widget.currentRow()
        music_num = r  # 未搜索时行号即编号

        music = str(self.table_widget.cellWidget(r, 0).text())
        for i in range(0, self.song_number):  # 编号
            if self.local_music_file[i] == music + '.mp3':
                music_num = i
                break

        self.local_music_play(music_num)  # music_num编号

    def lyric_display_part_dis(self):
        if self.lyric_display_part_right == 1:
            self.lyric_display_part_right = 0
            self.lyric_display_part.setIcon(self.icon_arrow_back_left)
            self.lyric_display_frame1.setVisible(False)
            self.lyric_display_frame1.setEnabled(False)
            self.lyric_display_frame2.setGeometry(QtCore.QRect(0, 0, 311, 371))
            self.lyric_display_frame2.setVisible(True)
            self.lyric_display_frame2.setEnabled(True)
        else:
            self.lyric_display_part_right = 1
            self.lyric_display_part.setIcon(self.icon_arrow_forward_right)
            self.lyric_display_frame2.setVisible(False)
            self.lyric_display_frame2.setEnabled(False)
            self.lyric_display_frame1.setGeometry(QtCore.QRect(0, 0, 311, 371))
            self.lyric_display_frame1.setVisible(True)
            self.lyric_display_frame1.setEnabled(True)

    def local_music_get(self):

        if os.path.exists('data/history.pickle') is True:
            self.history_music_index = reader_file('data/history.pickle')

        music_files = os.listdir('./Music')
        for index, music in enumerate(music_files):
            self.local_music_file[index] = music  # 文件名

            song_address = './Music/' + music  # 音乐的地址
            music_info = mutagen.File(song_address)
            music_title = music_info.tags['TIT2']  # 标题
            music_author = music_info.tags['TPE1']  # 歌手
            music_album = music_info.tags['TALB']  # 专辑
            # 音乐的时长
            audio = MP3(song_address)
            song_length = audio.info.length // 1
            song_length = int(song_length)
            min_time = song_length // 60  # 转换为分钟
            sec_time = song_length % 60  # 剩余的转换为秒
            if sec_time < 10:
                sec_time = '0' + str(sec_time)
            else:
                sec_time = str(sec_time)
            music_length = str(min_time) + ":" + sec_time

            self.local_music_file_info[index] = {'标题': str(music_title), '歌手': str(music_author),
                                                 '专辑': str(music_album), '时长': str(music_length),
                                                 '总长': song_length}

    def local_music_show(self):
        # print("本地音乐")

        self.middle_top_widget2.setEnabled(False)
        self.middle_top_widget2.setVisible(False)
        self.middle_top_widget.setVisible(True)
        self.middle_top_widget.setEnabled(True)

        self.show_label_info.setText("本地音乐")
        self.lineEdit.setText('')

        self.table_widget.setColumnCount(4)
        self.table_widget.setRowCount(self.song_number)
        self.table_widget.setHorizontalHeaderLabels(['标题', '歌手', '专辑', '时长'])

        for i in range(0, self.song_number):
            music_title = self.local_music_file_info[i]['标题']  # 标题
            music_author = self.local_music_file_info[i]['歌手']  # 歌手
            music_album = self.local_music_file_info[i]['专辑']  # 专辑
            music_length = self.local_music_file_info[i]['时长']  # 时长

            new_song_title = QtWidgets.QLabel(music_title)
            new_song_author = QtWidgets.QLabel(music_author)
            new_song_album = QtWidgets.QLabel(music_album)
            new_song_length = QtWidgets.QLabel(music_length)

            new_song_title.setWordWrap(True)
            new_song_author.setWordWrap(True)
            new_song_album.setWordWrap(True)
            new_song_length.setWordWrap(True)

            new_song_title.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_author.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_album.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_length.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))

            new_song_title.setAlignment(QtCore.Qt.AlignCenter)
            new_song_author.setAlignment(QtCore.Qt.AlignCenter)
            new_song_album.setAlignment(QtCore.Qt.AlignCenter)
            new_song_length.setAlignment(QtCore.Qt.AlignCenter)

            self.table_widget.setCellWidget(i, 0, new_song_title)
            self.table_widget.setCellWidget(i, 1, new_song_author)
            self.table_widget.setCellWidget(i, 2, new_song_album)
            self.table_widget.setCellWidget(i, 3, new_song_length)

    def local_music_play(self, song_num):  # 播放音乐,song_num为歌曲编号

        pygame.mixer.init()

        if self.console_button_control == 0:
            self.console_button_control = 1
            self.console_button_pause.setEnabled(True)
            self.console_button_forward.setEnabled(True)
            self.console_button_backward.setEnabled(True)

        m = pygame.mixer.music.get_busy()  # 检查音乐流是否在播放 暂停相当于在播放，返回True
        if m == 1:
            pygame.mixer.music.stop()
            self.progressbar_timer_bar.stop()

        song = self.local_music_file[song_num]  # 文件名
        song_address = './Music/' + str(song)  # 地址

        # print('正在播放：', song)

        self.progressBar_music_title.setText(self.local_music_file[song_num])
        self.lyric_display_partTop.setText(self.local_music_file[song_num])

        self.song_index = song_num  # 歌曲编号

        self.history_music_index.insert(0, self.local_music_file[song_num])

        pygame.mixer.music.queue(song_address)  # 下一首,单曲循环

        p1 = PIL.Image.open('music-picture/' + str(song_num + 1) + '.jpg')
        p = circle_image(p1)
        p = p.convert("RGBA")
        data = p.tobytes("raw", "RGBA")
        p = QtGui.QImage(data, p.size[0], p.size[1], QtGui.QImage.Format_ARGB32)
        self.console_picture.setPixmap(QtGui.QPixmap.fromImage(p))

        p = circle_image(p1, 200)
        p = p.convert("RGBA")
        data = p.tobytes("raw", "RGBA")
        p = QtGui.QImage(data, p.size[0], p.size[1], QtGui.QImage.Format_ARGB32)
        self.lyric_display_part_picture.setPixmap(QtGui.QPixmap.fromImage(p))

        song_length = self.local_music_file_info[song_num]['总长']

        self.progressbar_step = 0

        self.progressbar_timer_bar.start(1000)  # 1s间隔 进度条
        self.volume_timer_bar.start(1000)  # 1s间隔 音量

        self.progressBar.setRange(0, song_length)
        self.progressBar.setValue(self.progressbar_step)

        min_time = song_length // 60  # 转换为分钟
        sec_time = song_length % 60  # 剩余的转换为秒
        if sec_time < 10:
            sec_time = '0' + str(sec_time)
        else:
            sec_time = str(sec_time)
        length = str(min_time) + ":" + sec_time
        self.progressBar_all.setText(length)

        self.lrc_step = 0
        self.add_lyric()
        if len(self.lrc_dict) != 0:
            self.lyric_timer_bar.start(10)
            self.lyric_display_partD3.setText("")
            self.lyric_display_partD1.setText("")
        else:
            self.lyric_display_partCenter.setText("暂无歌词")
            self.lyric_display_partD1.setText("请下载歌词到歌词文件夹中")
            self.lyric_display_partD2.setText("")
            self.lyric_display_partU1.setText("")
            self.lyric_display_partU2.setText("")
            self.lyric_display_partD3.setText("暂无歌词")
            self.lyric_display_partD4.setText("请下载歌词到歌词文件夹中")

        self.playing = 1  # 正在播放
        self.console_button_pause.setIcon(QtGui.QIcon('./picture/play_button.ico'))
        pygame.mixer.music.load(song_address)
        pygame.mixer.music.play()  # 播放

    def local_music_play_pause(self):
        m = pygame.mixer.music.get_busy()  # 检查音乐流是否在播放 暂停相当于在播放，返回True
        if m is False:
            print('无歌曲')
            return
        if self.playing == 0:
            self.console_button_pause.setIcon(QtGui.QIcon('./picture/play_button.ico'))
            pygame.mixer.music.unpause()
            self.playing = 1
            self.progressbar_timer_bar.start(1000)
            if len(self.lrc_dict) != 0:
                self.lyric_timer_bar.start(10)
        else:
            self.console_button_pause.setIcon(QtGui.QIcon('./picture/pause_button.ico'))
            pygame.mixer.music.pause()
            self.playing = 0
            self.progressbar_timer_bar.stop()
            if self.lyric_timer_bar.isActive() is True:
                self.lyric_timer_bar.stop()

    def local_music_backward(self):  # 上一首
        if self.song_index < 0:
            return
        if self.song_index != 0:
            self.song_index -= 1

        pygame.mixer.music.stop()
        self.progressbar_timer_bar.stop()
        if self.lyric_timer_bar.isActive() is True:
            self.lyric_timer_bar.stop()

        self.local_music_play(self.song_index)

        self.progressBar_music_title.setText(self.local_music_file[self.song_index])

    def local_music_forward(self):  # 下一首
        if self.song_index != self.song_number - 1:
            self.song_index += 1
        # else:  # 最后一首
        #     print('最后一首')

        pygame.mixer.music.stop()
        self.progressbar_timer_bar.stop()
        if self.lyric_timer_bar.isActive() is True:
            self.lyric_timer_bar.stop()

        self.local_music_play(self.song_index)

        self.progressBar_music_title.setText(self.local_music_file[self.song_index])

    def process_bar_music(self):  # 进度条
        song_length = self.local_music_file_info[self.song_index]['总长']
        if self.progressbar_step >= song_length:
            self.progressbar_timer_bar.stop()
            return
        # 重置、刷新进度条
        self.progressBar.setValue(self.progressbar_step)
        self.progressbar_step = self.progressbar_step + 1

        song_length = self.progressbar_step
        min_time = song_length // 60  # 转换为分钟
        sec_time = song_length % 60  # 剩余的转换为秒
        if sec_time < 10:
            sec_time = '0' + str(sec_time)
        else:
            sec_time = str(sec_time)
        length = str(min_time) + ":" + sec_time
        self.progressBar_now.setText(length)

    def volume_bar_music(self):
        volume = self.volume_control.value() / 100
        pygame.mixer.music.set_volume(volume)
        # print(self.volume_control.value())

    def volume_mute(self):
        volume = pygame.mixer.music.get_volume()  # 0~1
        if volume == 0:  # 没有声音
            self.volume_timer_bar.start(1000)
            v = self.volume_play / 100
            pygame.mixer.music.set_volume(v)
            self.volume.setIcon(QtGui.QIcon('./picture/volume_play.ico'))
        else:  # 有声音
            self.volume_timer_bar.stop()
            pygame.mixer.music.set_volume(0)
            self.volume_play = volume * 100  # 0~100
            self.volume.setIcon(QtGui.QIcon('./picture/volume_pause.ico'))

    def search_icon_music(self):

        self.middle_top_widget2.setEnabled(False)
        self.middle_top_widget2.setVisible(False)
        self.middle_top_widget.setVisible(True)
        self.middle_top_widget.setEnabled(True)

        self.show_label_info.setText("搜索结果")
        search_music = self.lineEdit.text()
        if search_music == '':
            print('输入为空')
            QMessageBox.information(self, "提示", "输入为空", QMessageBox.Yes | QMessageBox.No)
            return
        search_music_result = []

        for i in range(0, self.song_number):  # 编号
            if search_music in self.local_music_file_info[i]['标题']:
                # or search_music in self.local_music_file_info[i]['歌手']\
                #                     or search_music in self.local_music_file_info[i]['专辑']
                search_music_result.append(i)

        self.table_widget.setRowCount(len(search_music_result))
        self.table_widget.setColumnCount(4)
        self.table_widget.setHorizontalHeaderLabels(['标题', '歌手', '专辑', '时长'])

        if search_music_result is None:
            return
        self.table_widget.clearContents()

        row = 0
        for index in search_music_result:
            music_title = self.local_music_file_info[index]['标题']  # 标题
            music_author = self.local_music_file_info[index]['歌手']  # 歌手
            music_album = self.local_music_file_info[index]['专辑']  # 专辑
            music_length = self.local_music_file_info[index]['时长']  # 时长

            new_song_title = QtWidgets.QLabel(music_title)
            new_song_author = QtWidgets.QLabel(music_author)
            new_song_album = QtWidgets.QLabel(music_album)
            new_song_length = QtWidgets.QLabel(music_length)

            new_song_title.setWordWrap(True)
            new_song_author.setWordWrap(True)
            new_song_album.setWordWrap(True)
            new_song_length.setWordWrap(True)

            new_song_title.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_author.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_album.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_length.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))

            new_song_title.setAlignment(QtCore.Qt.AlignCenter)
            new_song_author.setAlignment(QtCore.Qt.AlignCenter)
            new_song_album.setAlignment(QtCore.Qt.AlignCenter)
            new_song_length.setAlignment(QtCore.Qt.AlignCenter)

            self.table_widget.setCellWidget(row, 0, new_song_title)
            self.table_widget.setCellWidget(row, 1, new_song_author)
            self.table_widget.setCellWidget(row, 2, new_song_album)
            self.table_widget.setCellWidget(row, 3, new_song_length)

            row += 1

    def history_music_show(self):

        self.middle_top_widget2.setEnabled(False)
        self.middle_top_widget2.setVisible(False)
        self.middle_top_widget.setVisible(True)
        self.middle_top_widget.setEnabled(True)

        self.show_label_info.setText('最近播放')
        self.table_widget.clearContents()

        # 当前历史
        history_name = self.history_music_index

        if len(history_name) == 0:
            # print('没有所有记录')
            return

        new_history_name = []
        for i in history_name:
            if i not in new_history_name:
                new_history_name.append(i)

        history_name = new_history_name

        self.table_widget.setRowCount(len(history_name))
        self.table_widget.setColumnCount(4)
        self.table_widget.setHorizontalHeaderLabels(['标题', '歌手', '专辑', '时长'])

        row = 0  # 显示历史记录
        for music in history_name:
            index = 0
            for i in range(0, self.song_number):  # 编号
                if self.local_music_file[i] == music:
                    index = i
                    break

            music_title = self.local_music_file_info[index]['标题']  # 标题
            music_author = self.local_music_file_info[index]['歌手']  # 歌手
            music_album = self.local_music_file_info[index]['专辑']  # 专辑
            music_length = self.local_music_file_info[index]['时长']  # 时长

            new_song_title = QtWidgets.QLabel(music_title)
            new_song_author = QtWidgets.QLabel(music_author)
            new_song_album = QtWidgets.QLabel(music_album)
            new_song_length = QtWidgets.QLabel(music_length)

            new_song_title.setWordWrap(True)
            new_song_author.setWordWrap(True)
            new_song_album.setWordWrap(True)
            new_song_length.setWordWrap(True)

            new_song_title.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_author.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_album.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_length.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))

            new_song_title.setAlignment(QtCore.Qt.AlignCenter)
            new_song_author.setAlignment(QtCore.Qt.AlignCenter)
            new_song_album.setAlignment(QtCore.Qt.AlignCenter)
            new_song_length.setAlignment(QtCore.Qt.AlignCenter)

            self.table_widget.setCellWidget(row, 0, new_song_title)
            self.table_widget.setCellWidget(row, 1, new_song_author)
            self.table_widget.setCellWidget(row, 2, new_song_album)
            self.table_widget.setCellWidget(row, 3, new_song_length)
            row += 1

    def history_add(self):
        # localtime = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())  # 目前时间 2021-04-16 13:30:27
        # print(history_music, localtime)

        if len(self.history_music_index) == 0:
            return

        writer('data/history.pickle', self.history_music_index)

    def add_lyric(self):
        self.lrc_dict.clear()
        music_file = self.local_music_file[self.song_index]
        song_lrc_path = './lyric/' + music_file.replace(".mp3", ".lrc")
        # print(song_lrc_path)
        if os.path.exists(song_lrc_path) is False:
            # print('暂无歌词')
            return
        # print(song_lrc_path)
        lrc_file = open(song_lrc_path, 'r')
        lrc_list = lrc_file.readlines()

        lrc_dict = {}  # 歌词字典
        for i in lrc_list:
            i = i.replace('[', ']').strip('\n').split(']')
            if len(i) < 3:
                continue
            i[1] = str(i[1])
            i[2] = str(i[2])
            lrc_dict[i[1]] = i[2]
        # print(sorted(lrc_dict.keys()))
        self.lrc_dict = lrc_dict

    def lyric_show(self):
        lrc_dict = self.lrc_dict

        song_length = self.lrc_step

        mi_time = song_length % 100
        song_length = song_length // 100

        min_time = song_length // 60
        sec_time = song_length % 60

        self.lrc_step += 1

        if mi_time < 10:
            mi_time = '0' + str(mi_time)
        else:
            mi_time = str(mi_time)

        if sec_time < 10:
            sec_time = '0' + str(sec_time)
        else:
            sec_time = str(sec_time)

        if min_time < 10:
            min_time = '0' + str(min_time)
        else:
            min_time = str(min_time)

        length = min_time + ":" + sec_time + "." + mi_time

        key_list = sorted(lrc_dict.keys())
        # print(key_list)
        if length in lrc_dict.keys():

            self.lyric_display_partCenter.setText(lrc_dict[length])
            self.lyric_display_partD4.setText(lrc_dict[length])

            k = key_list.index(length)

            if k > 0:  # length是最后一个时间
                self.lyric_display_partD3.setText(lrc_dict[key_list[k - 1]])

            if k < len(key_list) - 2:
                self.lyric_display_partD1.setText(lrc_dict[key_list[k + 1]])
                self.lyric_display_partD2.setText(lrc_dict[key_list[k + 2]])

            if k > 1:
                self.lyric_display_partU1.setText(lrc_dict[key_list[k - 2]])
                self.lyric_display_partU2.setText(lrc_dict[key_list[k - 1]])

    def music_list_show(self):
        self.middle_top_widget.setEnabled(False)
        self.middle_top_widget.setVisible(False)
        self.middle_top_widget2.setVisible(True)
        self.middle_top_widget2.setEnabled(True)

        self.list_music_label.setText('我的歌单')

    def closeEvent(self, event):  # 重写退出
        self.history_add()  # QtCore.QCoreApplication.instance().quit()
        self.love_add()
        self.local_add()

    def setting(self):
        self.new_widow_setting.show()

    def recommend_show(self, recommend_content, recommend_text):

        self.middle_top_widget2.setEnabled(False)
        self.middle_top_widget2.setVisible(False)
        self.middle_top_widget.setEnabled(True)
        self.middle_top_widget.setVisible(True)

        self.table_widget.clearContents()
        self.show_label_info.setText(recommend_text)

        if len(recommend_content) == 0:
            print("'" + recommend_text + "' 歌单为空！")
            return

        self.table_widget.setRowCount(len(recommend_content))
        self.table_widget.setColumnCount(4)
        self.table_widget.setHorizontalHeaderLabels(['标题', '歌手', '专辑', '时长'])

        row = 0  # 显示历史记录
        for music in recommend_content:
            index = 0
            for i in range(0, self.song_number):  # 编号
                if self.local_music_file[i] == music:
                    index = i
                    break

            music_title = self.local_music_file_info[index]['标题']  # 标题
            music_author = self.local_music_file_info[index]['歌手']  # 歌手
            music_album = self.local_music_file_info[index]['专辑']  # 专辑
            music_length = self.local_music_file_info[index]['时长']  # 时长

            new_song_title = QtWidgets.QLabel(music_title)
            new_song_author = QtWidgets.QLabel(music_author)
            new_song_album = QtWidgets.QLabel(music_album)
            new_song_length = QtWidgets.QLabel(music_length)

            new_song_title.setWordWrap(True)
            new_song_author.setWordWrap(True)
            new_song_album.setWordWrap(True)
            new_song_length.setWordWrap(True)

            new_song_title.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_author.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_album.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))
            new_song_length.setCursor(QtGui.QCursor(QtCore.Qt.PointingHandCursor))

            new_song_title.setAlignment(QtCore.Qt.AlignCenter)
            new_song_author.setAlignment(QtCore.Qt.AlignCenter)
            new_song_album.setAlignment(QtCore.Qt.AlignCenter)
            new_song_length.setAlignment(QtCore.Qt.AlignCenter)

            self.table_widget.setCellWidget(row, 0, new_song_title)
            self.table_widget.setCellWidget(row, 1, new_song_author)
            self.table_widget.setCellWidget(row, 2, new_song_album)
            self.table_widget.setCellWidget(row, 3, new_song_length)
            row += 1

    def add_love_list(self, music_num):
        music = self.local_music_file[music_num]
        if music in self.recommend_love:
            QMessageBox.information(self, "提示", "已添加到此歌单", QMessageBox.Yes | QMessageBox.No)
            return
        self.recommend_love.insert(0, music)
        QMessageBox.information(self, "提示", "成功", QMessageBox.Yes | QMessageBox.No)

    def love_add(self):
        if len(self.recommend_love) == 0:  # recommend_love 是一个列表 存放歌曲名
            return
        file_writer = open(r'data/album_list/recommend_love.pickle', 'wb')
        pickle.dump(self.recommend_love, file_writer)
        file_writer.close()

    def add_local_list(self, music_num):
        music = self.local_music_file[music_num]
        if music in self.recommend_local:
            QMessageBox.information(self, "提示", "已添加到此歌单", QMessageBox.Yes | QMessageBox.No)
            return
        self.recommend_local.insert(0, music)
        QMessageBox.information(self, "提示", "成功", QMessageBox.Yes | QMessageBox.No)

    def local_add(self):
        if len(self.recommend_local) == 0:  # recommend_love 是一个列表 存放歌曲名
            return
        file_writer = open(r'data/album_list/recommend_local.pickle', 'wb')
        pickle.dump(self.recommend_local, file_writer)
        file_writer.close()

    def add_action_remove(self, music, r):
        if self.show_label_info.text() == '我喜欢':
            self.recommend_love.remove(music)
            self.recommend_show(self.recommend_love, self.show_label_info.text())
        elif self.show_label_info.text() == '默认歌单':
            self.recommend_local.remove(music)
            self.recommend_show(self.recommend_local, self.show_label_info.text())
        elif self.show_label_info.text() == '最近播放':
            self.history_music_index.remove(music)
            self.history_music_show()

    def local_show_menu(self, pos):

        r = self.table_widget.currentRow()
        music_num = r  # 未搜索时行号即编号
        music = str(self.table_widget.cellWidget(r, 0).text())
        for i in range(0, self.song_number):  # 编号
            if self.local_music_file[i] == music + '.mp3':
                music_num = i
                break

        if self.playing == 1 and music_num == self.song_index:
            play_action = QtWidgets.QAction(QtGui.QIcon("picture/pause_menu.ico"), "暂停")
            play_action.triggered.connect(self.local_music_play_pause)
        elif self.playing == 0 and music_num == self.song_index:
            play_action = QtWidgets.QAction(QtGui.QIcon("picture/pause_play.ico"), "暂停结束")
            play_action.triggered.connect(self.local_music_play_pause)
        else:
            play_action = QtWidgets.QAction(QtGui.QIcon("picture/menu_play.ico"), "播放")
            play_action.triggered.connect(self.table_widget_doubleclick)

        menu = QtWidgets.QMenu(self)

        add_menu = QtWidgets.QMenu(menu)  # 新建菜单
        add_menu.setTitle("加入歌单")
        add_menu.setIcon(QtGui.QIcon("picture/add_menu.ico"))

        add_action1 = QtWidgets.QAction("我喜欢")
        add_action1.triggered.connect(partial(self.add_love_list, music_num))
        add_menu.addAction(add_action1)

        add_action2 = QtWidgets.QAction("默认歌单")
        add_action2.triggered.connect(partial(self.add_local_list, music_num))
        add_menu.addAction(add_action2)

        menu.addAction(play_action)
        menu.addMenu(add_menu)

        if self.show_label_info.text() == '我喜欢' or self.show_label_info.text() == '默认歌单':
            add_action_remove = QtWidgets.QAction("从此歌单中移出")
            add_action_remove.triggered.connect(partial(self.add_action_remove, music + '.mp3', r))
            menu.addAction(add_action_remove)
        elif self.show_label_info.text() == '最近播放':
            add_action_remove = QtWidgets.QAction("删除此记录")
            add_action_remove.triggered.connect(partial(self.add_action_remove, music + '.mp3', r))
            menu.addAction(add_action_remove)

        screenPos = self.table_widget.mapToGlobal(pos)  # 使菜单在正常位置显示
        # print(type(screenPos))  # <class 'PyQt5.QtCore.QPoint'>
        menu.exec_(screenPos)

    def show_camera1(self):
        if self.camera_timer.isActive() is False:
            self.cap.open(0, cv2.CAP_DSHOW)
            self.camera_timer.start(0)
        else:
            self.camera_timer.stop()
            self.cap.release()

    def show_camera2(self):
        ret, frame = self.cap.read()
        frame = cv2.flip(frame, 1)  # 反向

        hand_image = frame[0:255, 0:300]  # 选取图片中固定位置作为手势输入
        cv2.rectangle(frame, (0, 0), (300, 255), (255, 0, 0), 0)  # 用红线画出手势识别框
        show1 = frame

        skin_image = skin_mask(hand_image)  # 皮肤检测

        ret, descriptor_in_use = fourierDesciptor(skin_image)
        # 去过高频的傅里叶变换

        if ret is None:
            return

        # global a
        # a += 1
        # if 23 > a > 1:
        #     filename = "skin_recognition/1/" + str(a-2) + '.png'
        #     cv2.imwrite(filename, ret)

        black = reconstruct(ret, descriptor_in_use)  # 重建轮廓图

        descirptor_in_use = abs(descriptor_in_use)
        temp = descirptor_in_use[1]

        if temp == 0:
            return

        mat = np.zeros((1, len(descirptor_in_use) - 1))
        for k in range(1, len(descirptor_in_use)):
            x_record = int(100 * descirptor_in_use[k] / temp)
            mat[0, k-1] = x_record

        try:
            label = self.model.predict(mat)
        except:
            self.figure = 0
        else:
            self.figure = label[0]

        show2 = black

        show_image1 = QtGui.QImage(show1.data, show1.shape[1], show1.shape[0], QtGui.QImage.Format_RGB888)
        self.label_show_camera_left.setPixmap(QtGui.QPixmap.fromImage(show_image1))

        show_image2 = QtGui.QImage(show2.data, show2.shape[1], show2.shape[0], QtGui.QImage.Format_RGB888)
        # Grayscale8
        self.label_show_camera_right.setPixmap(QtGui.QPixmap.fromImage(show_image2))

    def show_fig_label(self):

        if self.console_button_pause.isEnabled() is False:

            if self.figure == 1:  # 音量增
                self.fig_label.setText(str(self.figure))
            elif self.figure == 2:  # 音量减
                self.fig_label.setText(str(self.figure))
            elif self.figure == 3:  # 播放/暂停
                self.fig_label.setText(str(self.figure))
            elif self.figure == 4:  # 上一首
                self.fig_label.setText(str(self.figure))
            elif self.figure == 5:  # 下一首
                self.fig_label.setText(str(self.figure))
            elif self.figure == 0:
                self.fig_label.setText(str(self.figure))

            return

        if self.figure == 1:  # 音量增
            self.volume_control.setValue(self.volume_control.value() + 1)
            self.fig_label.setText(str(self.figure) + ':音量增')
        elif self.figure == 2:  # 音量减
            self.volume_control.setValue(self.volume_control.value() - 1)
            self.fig_label.setText(str(self.figure) + ':音量减')
        elif self.figure == 3:  # 播放/暂停
            self.local_music_play_pause()
            self.fig_label.setText(str(self.figure) + ':播放/暂停')
        elif self.figure == 4:  # 上一首
            self.local_music_backward()
            self.fig_label.setText(str(self.figure) + ':上一首')
        elif self.figure == 5:  # 下一首
            self.local_music_forward()
            self.fig_label.setText(str(self.figure) + ':下一首')
        elif self.figure == 0:
            self.fig_label.setText(str(self.figure))


# ###YCrCb颜色空间的Cr分量+Otsu法阈值分割算法
def skin_mask(roi):
    YCrCb = cv2.cvtColor(roi, cv2.COLOR_BGR2YCR_CB)  # 转换至YCrCb空间
    (y, cr, cb) = cv2.split(YCrCb)  # 拆分出Y,Cr,Cb值
    cr1 = cv2.GaussianBlur(cr, (5, 5), 3)

    _, skin = cv2.threshold(cr1, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)  # Otsu处理
    # res = cv2.bitwise_and(roi, roi, mask=skin)

    # skin1 = cv2.adaptiveThreshold(cr1, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY, 17, 2)  # 255白色
    # cv2.imshow('skin', skin)
    # cv2.imshow('skinadaptive', skin1)

    kernel = np.ones((5, 5), np.uint8)  # 设置卷积核
    erosion = cv2.erode(skin, kernel)  # 腐蚀操作
    dilation = cv2.dilate(erosion, kernel)  # 膨胀操作
    res = cv2.bitwise_and(roi, roi, mask=dilation)

    # cv2.imshow('skin', skin)
    # cv2.imshow('erosion', erosion)
    # dilation1 = cv2.dilate(skin, kernel)
    # cv2.imshow('dilation', dilation1)

    return res


def reader_file(filename):
    recommend_pro = []
    if os.path.exists(filename) is True:
        file_reader = open(filename, 'rb')
        recommend_pro = pickle.load(file_reader)  # 原本的记录
        file_reader.close()
    return recommend_pro


def writer(filename, content):
    file_writer = open(filename, 'wb')
    pickle.dump(content, file_writer)
    file_writer.close()


# 矩形图片转换成圆形
def circle_image(mark_img, size=70):
    def crop_max_square(pil_img):
        return crop_center(pil_img, min(pil_img.size), min(pil_img.size))

    def crop_center(pil_img, crop_width, crop_height):
        img_width, img_height = pil_img.size
        return pil_img.crop(((img_width - crop_width) // 2,
                             (img_height - crop_height) // 2,
                             (img_width + crop_width) // 2,
                             (img_height + crop_height) // 2))

    def mask_circle_transparent(pil_img, blur_radius, offset=0):
        offset = blur_radius * 2 + offset
        mask = PIL.Image.new("L", pil_img.size, 0)
        draw = PIL.ImageDraw.Draw(mask)
        draw.ellipse((offset, offset, pil_img.size[0] - offset, pil_img.size[1] - offset), fill=255)
        mask = mask.filter(ImageFilter.GaussianBlur(blur_radius))

        result = pil_img.copy()
        result.putalpha(mask)
        return result

    thumb_width = size  # 图片大小

    im_square = crop_max_square(mark_img).resize((thumb_width, thumb_width), PIL.Image.LANCZOS)
    im_thumb = mask_circle_transparent(im_square, 0)
    return im_thumb


class SecondWindow(QtWidgets.QWidget):
    def __init__(self):
        super().__init__()
        self.setFixedSize(500, 500)  # 设置大小
        self.setWindowTitle('功能介绍')  # 设置标题
        self.setWindowIcon(QtGui.QIcon('picture/setting.ico'))  # 设置图标

        self.setting_main_widget = QtWidgets.QWidget(self)
        self.setting_main_widget.setGeometry(QtCore.QRect(0, 0, 500, 500))
        self.setting_main_widget.setObjectName("setting_main_widget")

        # 功能标注
        self.function_show_label = QtWidgets.QLabel(self.setting_main_widget)
        self.function_show_label.setGeometry(QtCore.QRect(0, 0, 2500, 250))
        self.function_show = "功能介绍：\n1:音升\n2:音降\n3:播放/暂停\n4:上一首\n5:下一首"
        self.function_show_label.setText(self.function_show)

        self.setting_main_widget.setStyleSheet('''
                        QWidget#setting_main_widget{
                            background-color:rgb(228, 255, 203);
                        }
                        QLabel{
                            color:black;
                            font: 18pt '华文隶书';
                        }
                    ''')


# a = 0


def main():
    app = QtWidgets.QApplication(sys.argv)  # 实例化一个应用对象
    gui = MainUi()
    gui.show()
    sys.exit(app.exec_())  # 确保主循环安全退出


if __name__ == '__main__':
    main()
# 带时间轴的lrc文件
