package common

import (
	"fmt"
	"ljz/go_learn/model"

	"github.com/jinzhu/gorm"
	"github.com/spf13/viper"
)

func InitDB() *gorm.DB {
	driverName := viper.GetString("datasource.driverName")
	host := viper.GetString("datasource.host")
	port := viper.GetString("datasource.port")
	database := viper.GetString("datasource.database")
	userName := viper.GetString("datasource.username")
	passWord := viper.GetString("datasource.password")
	charset := viper.GetString("datasource.charset")
	args := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=%s&parseTime=True",
		userName,
		passWord,
		host,
		port,
		database,
		charset)
	db, err := gorm.Open(driverName, args)
	if err != nil { // 发生错误
		panic("failed to connect the database, error:" + err.Error())
	}
	db.AutoMigrate(&model.User{}) // 自动生成数据表
	return db
}

func GetDB() *gorm.DB {
	return InitDB()
}
