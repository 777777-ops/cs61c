#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

void lfsr_calculate(uint16_t *reg) {
    /* YOUR CODE HERE */
	uint16_t index_0 = *reg & 1;
	uint16_t index_2 = (*reg >> 2)& 1;
	uint16_t index_3 = (*reg >> 3)& 1;
	uint16_t index_5 = (*reg >> 5)& 1;
	
	uint16_t prt = *reg;	
	
	uint16_t left = (index_0 ^ index_2 ^ index_3 ^ index_5) << 15;
	prt = (prt >> 1)| left;
	*reg = prt;
	return;
}

