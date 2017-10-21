# Objective: Learn about Compilers

This file lists languages I have thought about writing a compiler
in. 

**TODO**: The languages marked as **TODO** I haven't written the basic
test program in, but I think it might be an interesting exercise.

**STALLED**: I tried writing the basic test program, but it was
annoying.

**DONE**: I finished writing the basic test program.

- in c
  - **STALLED**
  - mother of all languages
  - excruciatingly annoying to work with
  - no abstractions
  - few structural library support stuff
  - everything is written in c
  
- in C++
  - familiar
  - useful language
  - reference semantics ftw
  - lots of libraries
    - bad dependency hell
  - fast
  - no string switch
  - recently has union types with std::variant and std::any
  - little tooling for c++17

- in haskell
  - **TODO**
  - unfamiliar
  - tooling is weird

- in java
  - easy
  - lots of tooling
  - pretty fast
  - lots of libraries

- in f#
  - heard some nice things
  - kinda platform specific, but probably not an issue
  - **TODO**

- in scala
  - works with java
  - **TODO**
  - apparently very little tooling and language has strange hacks

- in rust
  - annoying
  - fast
  - more abstractions, but not that much more
  - unfamiliar
  - new, so not a lot of marketshare

- in C#
  - **TODO**

- in nim
  - **TODO**

- in pony
  - **TODO**
  - very experimental
  - very cool
  - definitely not stable yet. should not embark on any big projects

- in racket
  - no types, unless TypedRacket
  - not very well used
  - **TODO**

- in scheme
  - **TODO**

- in clojure
  - nice emacs tooling, but kind of annoying syntax
  - **TODO**
  - not a lot of tooling

- in D
  - kinda crazy
  - nobody knows it
  - **TODO**

- in python
  - no types
  - terrible for large projects
  - terrible for teams

- in ocaml
  - annoying
  - bad tooling

- in go
  - DONE
  - no algebraic data types
    - no generics, but interface{}
  - the go ecosystem is very opinionated.
  - fast to set up
  - annoying like c++
  - has threads, but they are not immediately useful

Why not ___?
- c: too annoying. not enough abstraction.
- python: bad for teams
- clojure: people don't know it
- D: crazy
- scheme/racket: not enough people know them well
- pony: experimental
- nim: early
- c#: if i use c#, i'd rather use java because kotlin/scala/ceylon/clojure

What's nice to have in a language i'm going to write a compiler in?
 - generics
 - string manipulation
 - regexps
 - speed
 - trees
 - maps
 - vectors
 - algebraic data types
 - methods
 - record types
 - union types or enum types

- write a compiler worth talking about
  - write a c compiler
  - write a lisp compiler
  - write a lisp interpreter
  - write a stack-based compiler
  - write a stack-based interpreter
  - write a language like c but... better.
  - write a grammar for a language like c but better.
