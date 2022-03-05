.PHONY: build

build:
	# GOOS=linux GOARCH=arm GOARM=5 go build -o pi-test-agent-arm
	GOOS=linux GOARCH=amd64 GOARM=5 go build -o pi-test-agent
