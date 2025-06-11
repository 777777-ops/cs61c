#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {

	if(head == NULL)
		return 0;
    	node *tortoise = head; 
    	node *hare = head;
	while(1){

        	if(tortoise->next != NULL){
			tortoise = tortoise -> next;
			hare = hare -> next;
		} 
	
		if(tortoise->next != NULL){
			tortoise = tortoise -> next;
		}

		if(tortoise->next == NULL)
			return 0;
		if(tortoise == hare)
			return 1;
	}
    	return 0;
}
