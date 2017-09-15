package main

import (
	"net/http"
	"fmt"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello World!")
}

func main() {
	fmt.Println("Running!")
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}
