package main

import (
	"fmt"
	"time"
)

func main() {

	fmt.Println("Running application now")
	go forever()
	select {} // block forever
}

func forever() {
	for {
		time.Sleep(5 * time.Minute)
	}
}
