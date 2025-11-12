package main

import (
	"fmt"
	"github.com/bradfitz/gomemcache/memcache"
	"log"
	"net/http"
)

const HIT_KEY = "api-hits"

func main() {

	// Catch all
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusNotFound)
		fmt.Fprint(w, "Not Found\n")
		log.Printf("Path '%s' not found\n", r.URL.Path)
	})

	http.HandleFunc("GET /hit", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "hit!\n")
		var cache = memcache.New("cache:11211")
		var _, err = cache.Increment(HIT_KEY, 1)
		if memcache.ErrCacheMiss == err {

			err = cache.Set(&memcache.Item{Key: HIT_KEY, Value: []byte("1"), Expiration: 0})
		}

		if nil != err {

			w.WriteHeader(http.StatusInternalServerError)
			log.Printf("Memcached is misbehaving: %s\n", err)
		}
	})

	log.Fatal(http.ListenAndServe(":http", nil))
}
