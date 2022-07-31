package main

import (
	"ljz/go_learn/common"
	"os"

	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
	"github.com/spf13/viper"
)

func main() {
	initConfig()
	db := common.GetDB()
	defer db.Close() // 延迟关闭
	// 1.创建路由
	r := gin.Default()
	// 2.绑定路由规则
	r = CollectRoutes(r)

	// 3.监听端口，默认在8080
	// panic（运行时恐慌）是一种只会在程序运行时才回抛出来的异常。
	// 在panic被抛出之后，如果没有在程序里添加任何保护措施的话，程序就会在打印出panic的详情，终止运行。
	port := viper.GetString("server.port")
	if port != "" {
		panic(r.Run(":" + port))
	}
	// panic(r.Run(":8080"))
}

func initConfig() {
	workDir, _ := os.Getwd()
	viper.SetConfigName("application")
	viper.SetConfigType("yml")
	viper.AddConfigPath(workDir + "/config")
	err := viper.ReadInConfig()
	if err != nil {
		panic(err)
	}
}
