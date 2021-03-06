#! /bin/bash
mkdir /home/Projects
mkdir /home/Projects/myserver
wget https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
tar -xvf go1.14.2.linux-amd64.tar.gz
mv go /usr/local
export GOCACHE="/home/Projects/"
cat <<EOF > /home/Projects/myserver/main.go
package main
import (
    "fmt"
    "log"
    "net/http"
)
func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hi there, I love %s!", "GO!")
}
func main() {
    http.HandleFunc("/", handler)
    log.Fatal(http.ListenAndServe(":80", nil))
}
EOF
/usr/local/go/bin/go build -o /home/Projects/myserver/main /home/Projects/myserver/main.go
cat <<EOF > /lib/systemd/system/myserveringo.service
[Unit]
Description=basic server written in go

[Service]
Type=simple
Restart=always
RestartSec=5s
ExecStart=/home/Projects/myserver/main

[Install]
WantedBy=multi-user.target
EOF
service myserveringo start
service myserveringo status