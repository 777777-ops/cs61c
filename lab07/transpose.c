#include "transpose.h"

/* The naive transpose function as a reference. */
void transpose_naive(int n, int blocksize, int *dst, int *src) {
    for (int x = 0; x < n; x++) {
        for (int y = 0; y < n; y++) {
            dst[y + x * n] = src[x + y * n];
        }
    }
}

/* Implement cache blocking below. You should NOT assume that n is a
 * multiple of the block size. */
void transpose_blocking(int n, int blocksize, int *dst, int *src) {
    for(int bh = 0; bh < n; bh += blocksize)
        for(int bw = 0; bw < n; bw += blocksize)
            for(int x = bh; x < bh + blocksize && x < n; x += 1)
                for(int y = bw; y < bw + blocksize && y < n; y += 1){
                    dst[y * n + x] = src[x * n + y];
                }
}
