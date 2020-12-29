#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "square.h"

const float VERSION = 0.03;
 
int main(int argc, char *argv[]) {
  double xvalue;

  if (2 == argc) {
    /* optind - The index in the argument value array (argv) where the first nonoption command-line argument can be found.  */
    xvalue = atof(argv[1]);
    printf("%0.7f\n", _square(xvalue));
  } else {
    printf("square: %.2f\n", VERSION);
    printf("Syntax:\n   square [number]\n\n");
    exit(0);
  }
  return 0;
}
