package main

import (
	"fmt"
	"regexp"
	"strconv"
)

type node struct {
	value    string
	children []pair
}

type pair struct {
	key   string
	value int
}

func (n *node) add(name string, value int) {
	n.children = append(n.children, pair{name, value})
}

func parse(tokens []string) *node {
	idenMatch := regexp.MustCompile("[A-Za-z_][0-9A-Za-z_]*")

	root := &node{"program", make([]pair, 0)}
	state := "iden"
	var iden string

	err := ""

	for _, token := range tokens {
		switch state {
		case "iden":
			if idenMatch.MatchString(token) {
				iden = token
				state = "eq"
			} else {
				err = "expecting identifier"
				break
			}
		case "eq":
			if "=" == token {
				state = "val"
			} else {
				err = "expecting eq"
				break
			}
		case "val":
			val, e := strconv.Atoi(token)
			if e != nil {
				err = "expecting integer value"
				break
			}
			root.add(iden, val)
			iden = ""
			state = "iden"
		}
	}

	if err != "" {
		fmt.Println(err, "at", tokens)
	}

	return root
}

func evaluate(n *node) map[string]int {
	m := make(map[string]int)

	for _, pair := range n.children {
		m[pair.key] = pair.value
	}

	return m
}

func main() {
	tokens := lex("example.k")
	fmt.Println(evaluate(parse(tokens)))
}
