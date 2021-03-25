package app

import (
	"encoding/json"
	"encoding/xml"
	"fmt"
	"net/http"
)

type Customer struct {
	Name string
	City string
	Zipcode string
}

func greet(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w,"Hello friends!!!")
}

func getAllCustomers(w http.ResponseWriter, r *http.Request)  {
	customers := []Customer {
		{"Ajay Kasam", "Derby", "DE236AY"},
		{"Sai Kasam", "Derby", "DE236AY"},
	}
	if r.Header.Get("Content-Type") == "application/xml" {
		w.Header().Add("Content-Type", "application/json")
		xml.NewEncoder(w).Encode(customers)
	} else {
		w.Header().Add("Content-Type", "application/json")
		json.NewEncoder(w).Encode(customers)
	}
}