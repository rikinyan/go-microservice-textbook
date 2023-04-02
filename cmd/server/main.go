package main

import (
	"log"

	"github.com/rikinyan/proglog/internal/server"
)

func main() {
	srv := server.NetHttpServer(":8080")
	log.Fatal(srv.ListenAndServe())
}
