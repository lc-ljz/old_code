package middleware

import (
	"ljz/go_learn/common"
	"ljz/go_learn/model"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

func AutoMiddleware() gin.HandlerFunc {
	return func(ctx *gin.Context) {
		// 获取authorization header
		tokenString := ctx.GetHeader("Authorization")

		// validate the token strings.HasPrefix函数用来检测字符串是否以指定的前缀开头
		if tokenString == "" || !strings.HasPrefix(tokenString, "Bearer") {
			ctx.JSON(http.StatusUnauthorized, gin.H{"code": 401, "msg": "权限不足"})
			ctx.Abort() //阻止调用后续的处理函数
			return
		}
		tokenString = tokenString[7:]

		token, claims, err := common.ParseToken(tokenString)

		if err != nil || !token.Valid {
			ctx.JSON(http.StatusUnauthorized, gin.H{"code": 401, "msg": "权限不足"})
			ctx.Abort() //阻止调用后续的处理函数
			return
		}

		// 验证通过后获取claim中的userId
		userId := claims.UserId
		db := common.GetDB()
		var user model.User
		db.First(&user, userId)

		// 用户
		if user.ID == 0 {
			ctx.JSON(http.StatusUnauthorized, gin.H{"code": 401, "msg": "权限不足"})
			ctx.Abort() //阻止调用后续的处理函数
			return
		}

		// 用户存在,将user的信息写入上下文
		ctx.Set("user", user)

		ctx.Next()

	}
}
