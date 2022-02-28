package main

import (
	"fmt"
	"os"
	"time"

	"github.com/robfig/cron/v3"
)

func main() {
	dat, err := os.ReadFile("/home/pi/.pi-test.version")
	if err != nil {
		panic(err)
	}
	fmt.Println("Running application now, version:", string(dat))
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
