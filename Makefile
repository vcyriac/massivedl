BUILDSTAMP = `date -u '+%Y-%m-%d_%I:%M:%S%p'`
GITHASH = `git rev-parse HEAD`
VERSION = 1.3
LDFLAGS = " \
	-X main.Version=$(VERSION) \
	-X main.Buildstamp=$(BUILDSTAMP) \
	-X main.Githash=$(GITHASH) \
"

all: massivedl_darwin_amd64

massivedl_linux_amd64: cmd/* internal/*
	env GOOS=linux GOARCH=amd64 \
		go build -ldflags $(LDFLAGS) -o bin/massivedl_linux_amd64 ./cmd/massivedl/...

massivedl_win_amd64.exe: cmd/* internal/*
	env GOOS=windows GOARCH=amd64 \
		go build -ldflags $(LDFLAGS) -o bin/massivedl_win_amd64.exe ./cmd/massivedl/...

massivedl_darwin_amd64: cmd/* internal/*
	env GOOS=darwin GOARCH=amd64 \
		go build -ldflags $(LDFLAGS) -o bin/massivedl_darwin_amd64 ./cmd/massivedl/...
