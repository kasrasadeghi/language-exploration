#include "util.h"

int is_digit(char c) {
  return c - '0' >= 0 && c - '0' < 10;
}
