package util

import (
	"math/rand"
	"time"

	"ljz/go_learn/model"

	"github.com/jinzhu/gorm"
)

func RandomString(n int) string {
	var letters = []byte("qwertyuiop")
	result := make([]byte, n)

	rand.Seed(time.Now().Unix())
	for i := range result {
		result[i] = letters[rand.Intn(len(letters))]
	}
	return string(result)
}

func IsTelephoneExist(db *gorm.DB, telephone string) bool {
	var user model.User
	db.Where("telephone = ?", telephone).First(&user)
	return user.ID != 0
}
