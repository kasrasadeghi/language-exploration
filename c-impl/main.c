#include <stdio.h>  // getchar(), ungetc(), puts()
#include <stdlib.h> // stoi()
#include "str.h"    // String, str_*()
#include "util.h"   // is_digit

enum State {
  IDEN,
  EQ,
  NUMBER
};

/**
 * Peek at the next stdin char without consumption 
 */
int peekchar(void) {
  int c = getchar();
  if (c != EOF) ungetc(c, stdin);
  return c;
}

void str_get(String* s) {
  str_push(s, getchar());
}

void lex_iden(String* s) {
  char* output = str_flush(s);
  printf("IDEN: %s\n", output);
  free(output);
}

void lex_eq() {
  puts("EQ");
}

void lex_val(String* s) {
  char* output = str_flush(s);
  printf("INT: %s\n", output);
  free(output);
}

int main() {
  int c;
  enum State state = IDEN;
  String* acc = str_make();
  
  while ((c = peekchar()) != EOF) {
    switch (state) {
    case IDEN: //TODO starting IDEN
      if (c == ' ') {
        getchar();
      } else if (c == '=') {
        lex_iden(acc);
        state = EQ;
      } else {
        str_get(acc);
      }
      break;
      
    case EQ:
      if (c == ' ') {
        getchar();
      } else if (c == '=') {
        getchar();
        lex_eq();
        state = NUMBER;
      } else {
        // error?
      }
      break;
      
    case NUMBER:
      if (c == ' ') getchar();
      else if (c == '\n') {
        lex_val(acc);
        getchar();
        state = IDEN;
      } else if (is_digit(c)) {
        str_get(acc);
      }      
      break;
    }
  }

  if (acc->length != 0 && state == NUMBER) {
    lex_val(acc);
  }

  printf("Hello World");
  return 3;
}
