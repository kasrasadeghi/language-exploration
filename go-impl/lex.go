package main

import (
	"bufio"
	"log"
	"os"
	"strings"
)

func lex(filename string) []string {
	file, err := os.Open(filename)
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	tokens := make([]string, 0, 5)

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		if !strings.HasPrefix(scanner.Text(), "#") {
			tokens = append(tokens, strings.Fields(scanner.Text())...)
		}
	}

	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}

	return tokens
}
