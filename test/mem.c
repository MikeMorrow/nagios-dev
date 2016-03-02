#include <malloc.h>
#include <unistd.h>
#include <memory.h>
#define MB 1024 * 1024
int main() {
  while (1) {
    void *p = malloc( 256*MB );
    memset(p,0, 256*MB );
    sleep(60*5);
  }
}
