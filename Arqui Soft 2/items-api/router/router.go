package router

import (
	"fmt"
	itemController "items-api/controllers/item"

	"github.com/gin-gonic/gin"
)

func MapUrls(router *gin.Engine) {
	// Products Mapping
	//router.GET("/items/:id", itemController.Get)
	router.POST("/items", itemController.Insert)

	fmt.Println("Finishing mappings configurations")
}
