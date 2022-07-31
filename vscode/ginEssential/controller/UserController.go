package controller

import (
	"log"
	"net/http"

	"ljz/go_learn/common"
	"ljz/go_learn/dto"
	"ljz/go_learn/model"
	"ljz/go_learn/response"
	"ljz/go_learn/util"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
)

func Register(ctx *gin.Context) {
	//		c.String(http.StatusOK, "Hello World!")
	db := common.GetDB()
	// 获取参数
	username := ctx.PostForm("username")
	telephone := ctx.PostForm("telephone")
	passwd := ctx.PostForm("passwd")
	// 数据验证
	if len(telephone) != 11 {
		// 422请求格式错误，但出现了语义错误，以至于服务端无法响应
		response.Response(ctx, http.StatusUnprocessableEntity, 442, nil, "手机号必须要11位")
		return
	}
	if len(passwd) < 6 {
		response.Response(ctx, http.StatusUnprocessableEntity, 442, nil, "密码不能少于6位")
		return
	}
	// 如果名称没有传，给一个10位的随机字符串
	if len(username) == 0 {
		username = util.RandomString(10)
	}
	log.Println(username, telephone, passwd)
	// 判断手机号是否存在
	if util.IsTelephoneExist(db, telephone) {
		response.Response(ctx, http.StatusUnprocessableEntity, 442, nil, "用户已存在")
		return
	}
	// 创建用户
	// []byte(passwd) -> 转为ASCII码
	// 密码加密
	hasedpasswd, err := bcrypt.GenerateFromPassword([]byte(passwd), bcrypt.DefaultCost)
	if err != nil {
		response.Response(ctx, http.StatusUnprocessableEntity, 442, nil, "密码加密错误")
		return
	}
	newUser := model.User{
		Name:      username,
		Telephone: telephone,
		Passwd:    string(hasedpasswd),
	}
	db.Create(&newUser)
	// 返回结果
	response.Success(ctx, nil, "注册成功")
	// ctx.JSON(http.StatusOK, gin.H{
	// 	"code": 200, "msg": "注册成功",
	// })
}

func Login(ctx *gin.Context) {
	db := common.GetDB()

	// 获取参数
	telephone := ctx.PostForm("telephone")
	passwd := ctx.PostForm("passwd")
	// 数据验证
	if len(telephone) != 11 {
		ctx.JSON(http.StatusUnprocessableEntity, gin.H{ // 422请求格式错误，但出现了语义错误，以至于服务端无法响应
			"code": 422, "msg": "手机号必须要11位",
		})
		return
	}
	if len(passwd) < 6 {
		ctx.JSON(http.StatusUnprocessableEntity, gin.H{
			"code": 422, "msg": "密码不能少于6位",
		})
		return
	}
	// 判断手机号
	var user model.User
	db.Where("telephone = ?", telephone).First(&user)
	if user.ID == 0 {
		ctx.JSON(http.StatusUnprocessableEntity, gin.H{
			"code": 422, "msg": "用户名不存在!",
		})
		return
	}
	// 判断密码
	if err := bcrypt.CompareHashAndPassword([]byte(user.Passwd), []byte(passwd)); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{
			"code": 400, "msg": "密码错误",
		})
		return
	}
	// 发放token
	token, err := common.ReleaseToken(user)
	if err != nil {
		ctx.JSON(http.StatusInternalServerError, gin.H{
			"code": 500, "msg": "系统异常",
		})
		log.Printf("token generate error : %v", err)
		return
	}
	// 返回结果
	response.Success(ctx, gin.H{"token": token}, "登陆成功")
	// ctx.JSON(http.StatusOK, gin.H{
	// 	"code": 200,
	// 	"data": gin.H{"token": token},
	// 	"msg":  "登陆成功",
	// })
}

func Info(ctx *gin.Context) {
	user, _ := ctx.Get("user")
	ctx.JSON(http.StatusOK, gin.H{
		"code": 200, "data": gin.H{"user": dto.ToUserDto(user.(model.User))},
	})
}
