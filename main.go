package main

import (
	"fmt"
	"os"
	"time"

	"github.com/robfig/cron/v3"
)

func main() {
	version := os.Getenv("APP_VERSION")
	if version == "" {
		version = "unknown"
	}
	fmt.Println("Running application now, version:", version)
	var cronLib *cron.Cron
	cronLib = cron.New()
	cronLib.AddFunc("@every 5m", func() {
		fmt.Println("")
	})
	cronLib.Start()

	go forever()
	select {} // block forever
}

func forever() {
	for {
		time.Sleep(5 * time.Minute)
	}
}

//
