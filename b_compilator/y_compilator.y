%{
#define _GNU_SOURCE
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>

#define VAR_NOT_FOUND 2000000000

int global_fd;

void yyerror( const char *s );
int yylex(void);
int yyunput(char c);

struct s_variable {
    int offset;
    char *name;
};
typedef struct s_variable t_var;

struct ctx_node {
    struct ctx_node *next;
    struct s_variable *var;
};
typedef struct ctx_node t_cn;

t_cn *ctxt = NULL;
int params_offset = 2;
int var_offset = -1;
int counter = 0;

struct label_list {
    struct label_list *next;
    char *name;
};

typedef struct label_list t_ll;

struct params_list {
    struct params_list *next;
    char *name;
};

typedef struct params_list t_pl;

t_pl *params = NULL;

void push_param(char *var_name) {
    t_pl *node = malloc(sizeof(t_pl));
    node->name = var_name;
    node->next = params;
    params = node;
}

t_ll *labels = NULL;

char *func_name = NULL;

void push_label() {
    char *label_name;
    asprintf(&label_name, "%s_%d", func_name, counter);
    counter++;
    t_ll *node = malloc(sizeof(t_ll));
    node->next = labels;
    node->name = label_name;
    labels = node;
}

void pop_label() {
    t_ll *node = labels->next;
    free(labels->name);
    free(labels);
    labels = node;
}

char *get_label() { return labels->name; }

void delete_s_variable(t_var *var) {
    free(var->name);
    free(var);
}


void delete_ctx_node(t_cn *node) {
    if (node == NULL) return ;

    delete_ctx_node(node->next);
    delete_s_variable(node->var);
    free(node);
}

void open_ctxt(char* name) {
    counter = 0;
    delete_ctx_node(ctxt);
    if (func_name) { free(func_name); func_name = NULL; }
    func_name = name;
    params_offset = 2;
    var_offset = -1;
    ctxt = NULL;
}

void add_new_node_to_context(t_cn *new_node) {
    new_node->next = ctxt;
    ctxt = new_node;
}

t_cn *new_node(int offset, char *str) {
    t_cn *new;

    new = malloc(sizeof(t_cn));
    new->next = NULL;
    new->var = malloc(sizeof(t_var));
    new->var->name = str;
    new->var->offset = offset;
    return new;
}

void declare_variable(char *name) {
    t_cn *node = new_node(var_offset * 4, name);
    add_new_node_to_context(node);
    --var_offset;
}

void declare_params(char *name) {
    t_cn *node = new_node(params_offset * 4, name);
    add_new_node_to_context(node);
    ++params_offset;

}

int lookup(char *name) {
    t_cn *node = ctxt;

    while (node) {
        if (strcmp(node->var->name, name) == 0) {
            return node->var->offset;
        }
        node = node->next;
    }
    return VAR_NOT_FOUND;
}



%}

%right ASSIGN 
%left S_INF S_SUP INF SUP EQUAL NOT_EQUAL
%left PLUS MINUS 
%left ASTE SLASH PERCENT 


%token O_PAR 
%token COLON 
%token C_PAR 
%token D_QUOTES 
%token S_QUOTES 
%token O_BRACKET 
%token C_BRACKET 
%token O_CURLY_BRACKET 
%token C_CURLY_BRACKET 
%token COMMA 
%token PERIOD 
%token SEMICOLON 
%token EOLN 
%token AUTO 
%token EXTRN 
%token IF 
%token FOR 
%token WHILE 
%token REPEAT 
%token SWITCH 
%token DO 
%token RETURN 
%token BREAK 
%token GOTO 
%token NEXT 
%token CASE 
%token DEFAULT 


%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE 

%union { int ival; char *sval ; }

%token <ival> NB 
%token <sval> ID LONG_ID TOO_LONG_ID

/*%type <s_node> expression func_params function_call function_definition program program_elem some_params statement statement_list */
%type <sval> variable expression function_call var_declaration function_definition_prelude comp_operation
%type <ival> var_list expression_list 
%%

any_program:
           /* empty */
           | program
           ;

program:
       program_elem
       | program program_elem
       ;

program_elem:
            var_declaration {}
            | function_definition {}
            ;


function_definition_start: function_definition_prelude  func_params C_PAR O_CURLY_BRACKET {
               dprintf(global_fd, ".global %s\n", func_name);
               dprintf(global_fd, "%s:\n", $1);
               dprintf(global_fd, "push ebp\n");
               dprintf(global_fd, "mov ebp, esp\n");
            };

function_definition_prelude: ID O_PAR {
               open_ctxt(strdup($1));
               $$ = $1;
                           };
function_definition:
            function_definition_start statement_list C_CURLY_BRACKET {
               dprintf(global_fd, "end_%s:\n", func_name);
               dprintf(global_fd, "mov esp, ebp\n");
               dprintf(global_fd, "pop ebp\n");
               dprintf(global_fd, "ret\n");
           };
           

func_params:
           /* empty */  
           | some_params {
                while (params) {
                    t_pl *tmp = params;
                    declare_params(params->name);
                    params = params->next;
                    free(tmp);
                }
           }
           ;

some_params:
           variable {
                push_param($1);
           }
           | some_params COMMA variable { push_param($3); }
           ;

variable:
        LONG_ID 
        | ID 
        ;

var_list:
        variable { declare_variable($1); $$ = 1; }
        | var_list COMMA variable { declare_variable($3); $$ = $1 + 1; }
        ;

var_declaration: AUTO var_list {
               int offset = $2 * 4;
               dprintf(global_fd, "sub esp, %d\n", offset);
           };
               

expression:
          function_call {
          }
          | variable {
                
                int offset = lookup($1);
                if (offset == VAR_NOT_FOUND) {
                    dprintf(2, "ERROR: %s was not found in function context\n", $1);
                    exit(2);
                }
                dprintf(global_fd, "mov eax, dword ptr[ebp %+d]\n", offset);
                dprintf(global_fd, "push eax\n");
          }
          | NB {
                dprintf(global_fd, "push %d\n", $1);
		  }
          | expression PLUS expression {
                dprintf(global_fd, "pop ebx\n");
                dprintf(global_fd, "pop eax\n");
                dprintf(global_fd, "add eax, ebx\n");
                dprintf(global_fd, "push eax\n");
			}
				
          | expression MINUS expression
           {
                dprintf(global_fd, "pop ebx\n");
                dprintf(global_fd, "pop eax\n");
                dprintf(global_fd, "sub eax, ebx\n");
                dprintf(global_fd, "push eax\n");
			}
				
          | variable ASSIGN expression
               {
                dprintf(global_fd, "pop eax\n");
                int offset = lookup($1);
                if (offset == VAR_NOT_FOUND) {
                    dprintf(2, "ERROR: %s was not found in function context\n", $1);
                    exit(2);
                }
                dprintf(global_fd, "mov dword ptr[ebp %+d], eax\n", offset);
                dprintf(global_fd, "push eax\n");
          }
				
          | expression ASTE expression
           {
                dprintf(global_fd, "pop ebx\n");
                dprintf(global_fd, "pop eax\n");
                dprintf(global_fd, "imul eax, ebx\n");
                dprintf(global_fd, "push eax\n");
			}
				
          | expression PERCENT expression
           {
                dprintf(global_fd, "pop ebx\n");
                dprintf(global_fd, "pop eax\n");
                dprintf(global_fd, "cdq\n");
                dprintf(global_fd, "idiv ebx\n");
                dprintf(global_fd, "push edx\n");
			}
				
          | expression SLASH expression
           {
                dprintf(global_fd, "pop ebx\n");
                dprintf(global_fd, "pop eax\n");
                dprintf(global_fd, "cdq\n");
                dprintf(global_fd, "idiv ebx\n");
                dprintf(global_fd, "push eax\n");
			}
          | expression comp_operation expression %prec EQUAL{
                dprintf(global_fd, "pop ebx\n");
                dprintf(global_fd, "pop eax\n");
                dprintf(global_fd, "cmp eax, ebx\n");
                dprintf(global_fd, "%s\n", $2);
                dprintf(global_fd, "movzx eax, al\n");
          }


comp_operation:
          EQUAL { $$ = "sete al\n"; }
          | NOT_EQUAL { $$ = "setne al\n"; }
          | SUP { $$ = "setge al\n"; }
          | S_SUP { $$ = "setg al\n"; }
          | INF { $$ = "setle al\n"; }
          | S_INF { $$ = "setl al\n"; }
          ;

expression_list: expression { $$ = 1; }
               | expression_list COMMA expression { $$ = $1 + 1; }
               ;


function_call: ID O_PAR expression_list C_PAR {
                dprintf(global_fd, "call %s\n", $1);
                dprintf(global_fd, "add esp, %d\n", $3 * 4);
                dprintf(global_fd, "push eax\n");
             }
             | ID O_PAR C_PAR {
                dprintf(global_fd, "call %s\n", $1);
                dprintf(global_fd, "push eax\n");
             }
             ;


if_prelude: IF O_PAR expression C_PAR {
                push_label();
                dprintf(global_fd, "pop eax\n");
                dprintf(global_fd, "cmp eax, 0\n");
                dprintf(global_fd, "je else_%s_start\n", get_label());
          };

if_condition: if_prelude statement {
                dprintf(global_fd, "jmp else_%s_end\n", get_label());
                dprintf(global_fd, "else_%s_start:\n", get_label());
            };

optional_else: 
             /* nothing */ %prec LOWER_THAN_ELSE {
                dprintf(global_fd, "else_%s_end:\n", get_label());
             }
             | ELSE statement{
                dprintf(global_fd, "else_%s_end:\n", get_label());
             };

while_label: WHILE {
                push_label();
                dprintf(global_fd, "while_%s_start:\n", get_label());
           }

while_prelude: while_label O_PAR expression C_PAR {
                dprintf(global_fd, "pop eax\n");
                dprintf(global_fd, "cmp eax, 0\n");
                dprintf(global_fd, "je while_%s_end\n", get_label());
             };

condition_branching: if_condition optional_else {}
                   | while_prelude statement {
                        dprintf(global_fd, "jmp while_%s_start\n", get_label());
                        dprintf(global_fd, "while_%s_end:\n", get_label());
                   }
                   ;


statement: condition_branching {
            pop_label();
         }
         | O_CURLY_BRACKET statement_list C_CURLY_BRACKET {}
         | ID COLON { printf("%s:\n", $1);}
         | var_declaration SEMICOLON {}
         | expression SEMICOLON {
            dprintf(global_fd, "pop eax\n");
         }
         | RETURN expression SEMICOLON {
            dprintf(global_fd, "pop eax\n");
            dprintf(global_fd, "jmp end_%s\n", func_name);
         }
         | SEMICOLON {}
         ;

statement_list:
        /* empty */
        | statement_list statement 
        ;


%%


#include <stdio.h>
#include <ctype.h>
char *progname;

int main( int argc, char *argv[] )
{
  (void)argc;
  global_fd = creat("compilation.s", 0700);
  progname = argv[0];
  dprintf(global_fd, ".intel_syntax noprefix\n.text\n");
  yyparse();
  return 0;
}

void yyerror( const char *s ) {
  fprintf( stderr ,"%s: %s\n" , progname , s );
}
