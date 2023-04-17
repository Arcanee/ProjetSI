#ifndef TAB_SYMBOLE_H
#define TAB_SYMBOLE_H

#define MAXSIZE 16

struct Symbol {
    char nom[MAXSIZE];
    int init;
    int depth;
};

struct symbolTab {
    int size; 
    int nb_symboles;
    int global_depth;
    struct Symbol* table;
};



void initTab();
void addSym(char *s);
void removeSym();
void clearTab();
void printSym(struct Symbol s);
void printTab();
int global_depth(); 
void inc_depth();
void dec_depth();
void set_sym_init(int index);
int get_addr(char* s);
int check_duplicate(char* s);
int get_last(); 
int get_next_last();
void supp_last();
int is_init(char* s);

#endif