package main

import (
    "github.com/gin-gonic/gin"
    "net/http"
)

func main() {
    // Create a Gin router
    router := gin.Default()

    // Define a route for the root path
    router.GET("/", func(c *gin.Context) {
        c.JSON(http.StatusOK, gin.H{
            "msg": "Hello World",
        })
    })

    // Run the server on port 8080
    router.Run(":8080")
}

