package main

import (
	"ljz/go_learn/controller"
	"ljz/go_learn/middleware"

	"github.com/gin-gonic/gin"
)

func CollectRoutes(r *gin.Engine) *gin.Engine {

	// gin.Context, 封装了request和reponse
	r.POST("/api/auth/register", controller.Register)
	r.POST("/api/auth/login", controller.Login)
	r.GET("/api/auth/info", middleware.AutoMiddleware(), controller.Info)
	return r
}
