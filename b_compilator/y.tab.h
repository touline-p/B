/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    ASSIGN = 258,                  /* ASSIGN  */
    S_INF = 259,                   /* S_INF  */
    S_SUP = 260,                   /* S_SUP  */
    INF = 261,                     /* INF  */
    SUP = 262,                     /* SUP  */
    EQUAL = 263,                   /* EQUAL  */
    NOT_EQUAL = 264,               /* NOT_EQUAL  */
    PLUS = 265,                    /* PLUS  */
    MINUS = 266,                   /* MINUS  */
    ASTE = 267,                    /* ASTE  */
    SLASH = 268,                   /* SLASH  */
    PERCENT = 269,                 /* PERCENT  */
    O_PAR = 270,                   /* O_PAR  */
    COLON = 271,                   /* COLON  */
    C_PAR = 272,                   /* C_PAR  */
    D_QUOTES = 273,                /* D_QUOTES  */
    S_QUOTES = 274,                /* S_QUOTES  */
    O_BRACKET = 275,               /* O_BRACKET  */
    C_BRACKET = 276,               /* C_BRACKET  */
    O_CURLY_BRACKET = 277,         /* O_CURLY_BRACKET  */
    C_CURLY_BRACKET = 278,         /* C_CURLY_BRACKET  */
    COMMA = 279,                   /* COMMA  */
    PERIOD = 280,                  /* PERIOD  */
    SEMICOLON = 281,               /* SEMICOLON  */
    EOLN = 282,                    /* EOLN  */
    AUTO = 283,                    /* AUTO  */
    EXTRN = 284,                   /* EXTRN  */
    IF = 285,                      /* IF  */
    FOR = 286,                     /* FOR  */
    WHILE = 287,                   /* WHILE  */
    REPEAT = 288,                  /* REPEAT  */
    SWITCH = 289,                  /* SWITCH  */
    DO = 290,                      /* DO  */
    RETURN = 291,                  /* RETURN  */
    BREAK = 292,                   /* BREAK  */
    GOTO = 293,                    /* GOTO  */
    NEXT = 294,                    /* NEXT  */
    CASE = 295,                    /* CASE  */
    DEFAULT = 296,                 /* DEFAULT  */
    LOWER_THAN_ELSE = 297,         /* LOWER_THAN_ELSE  */
    ELSE = 298,                    /* ELSE  */
    NB = 299,                      /* NB  */
    ID = 300,                      /* ID  */
    LONG_ID = 301,                 /* LONG_ID  */
    TOO_LONG_ID = 302              /* TOO_LONG_ID  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define ASSIGN 258
#define S_INF 259
#define S_SUP 260
#define INF 261
#define SUP 262
#define EQUAL 263
#define NOT_EQUAL 264
#define PLUS 265
#define MINUS 266
#define ASTE 267
#define SLASH 268
#define PERCENT 269
#define O_PAR 270
#define COLON 271
#define C_PAR 272
#define D_QUOTES 273
#define S_QUOTES 274
#define O_BRACKET 275
#define C_BRACKET 276
#define O_CURLY_BRACKET 277
#define C_CURLY_BRACKET 278
#define COMMA 279
#define PERIOD 280
#define SEMICOLON 281
#define EOLN 282
#define AUTO 283
#define EXTRN 284
#define IF 285
#define FOR 286
#define WHILE 287
#define REPEAT 288
#define SWITCH 289
#define DO 290
#define RETURN 291
#define BREAK 292
#define GOTO 293
#define NEXT 294
#define CASE 295
#define DEFAULT 296
#define LOWER_THAN_ELSE 297
#define ELSE 298
#define NB 299
#define ID 300
#define LONG_ID 301
#define TOO_LONG_ID 302

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 186 "y_compilator.y"
 int ival; char *sval ; 

#line 164 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
