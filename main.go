package main

import (
	"fmt"
	"time"

	"github.com/robfig/cron/v3"
)

func main() {

	fmt.Println("Running application now")
	var cronLib *cron.Cron
	cronLib = cron.New()
	cronLib.AddFunc("@every 15s", func() {
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
