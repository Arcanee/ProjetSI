#include "tabSymbole.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

static struct symbolTab tab;
static int init = 0;



void initTab() {
    if (!init) {
        tab.size = 4;
        tab.nb_symboles = 0;
        tab.global_depth = -1;
        tab.table = malloc(4*sizeof(struct Symbol));
        init++;
    }
}


void addSym(char *s){
    if (init) {
        if (tab.size == tab.nb_symboles)
        {
            tab.table = realloc(tab.table, 2*tab.size*sizeof(struct Symbol)); 
            tab.size = 2*tab.size; 
        }

        //Check duplicates
        if (check_duplicate(s)) {
            printf("Redefinition of variable\n");
            exit(-1);
        }

        strcpy(tab.table[tab.nb_symboles].nom, s); 
        tab.table[tab.nb_symboles].depth = tab.global_depth; 
        tab.table[tab.nb_symboles].init = 0; 
        tab.nb_symboles += 1; 
    }
}


void removeSym(){
    if (init) {
        while (tab.nb_symboles > 0 && tab.global_depth == tab.table[tab.nb_symboles-1].depth) {
            tab.nb_symboles -= 1;
        }
        tab.global_depth -= 1;
    }
}


void clearTab()
{
    if (init) {
        tab.nb_symboles = 0; 
    }
}

void printSym(struct Symbol s) {
    printf("Nom: %s | init: %d | depth: %d\n", s.nom, s.init, s.depth);
}

void printTab() {
    if (init) {
        printf("[size = %d] [curr_depth = %d] [nb_sym = %d]\n", tab.size, tab.global_depth, tab.nb_symboles);
        for (int i = 0; i < tab.nb_symboles; i++) {
            printSym(tab.table[i]);
        }
    }
    printf("\n\n");
}

int global_depth()
{
    return tab.global_depth;
}

void inc_depth()
{
    tab.global_depth += 1; 
}

void dec_depth()
{
    tab.global_depth --;
}

void set_sym_init()
{
    tab.table[tab.nb_symboles-1].init = 1;
}

int get_addr(char* s)
{
    int addr = -1; 
    for (int i = 0; i < tab.nb_symboles; i++)
    {
        if (!strcmp(s, tab.table[i].nom))
        {
            addr = i; 
        }
    }
    if (addr ==  -1)
    {
        printf("Var not in scope\n"); 
        exit(-1); 
    }
    return addr; 
}

int check_duplicate(char* s)
{
    int res = 0; 
    for (int i = 0; i < tab.nb_symboles; i++)
    {   
        if (tab.table[i].depth == tab.global_depth && !strcmp(s, tab.table[i].nom))
        {
            res = 1; 
            printf("duplicate between %s and %s\n", s, tab.table[i].nom);
        }
    }
    return res; 
}