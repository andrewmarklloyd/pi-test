.PHONY: build

build:
	GOOS=linux GOARCH=arm GOARM=6 go build -o pi-test-agent-arm
	GOOS=linux GOARCH=amd64 GOARM=6 go build -o pi-test-agent-amd64
