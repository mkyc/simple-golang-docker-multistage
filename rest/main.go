package main

import (
	"net/http"
)

type hello struct{}

func (s *hello) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	w.Write([]byte(`{"message": "hello world"}`))
}

func main() {
	s := &hello{}
	http.Handle("/", s)
	http.ListenAndServe(":8080", nil)
}
