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
    C_PAR = 271,                   /* C_PAR  */
    D_QUOTES = 272,                /* D_QUOTES  */
    S_QUOTES = 273,                /* S_QUOTES  */
    O_BRACKET = 274,               /* O_BRACKET  */
    C_BRACKET = 275,               /* C_BRACKET  */
    O_CURLY_BRACKET = 276,         /* O_CURLY_BRACKET  */
    C_CURLY_BRACKET = 277,         /* C_CURLY_BRACKET  */
    COMMA = 278,                   /* COMMA  */
    PERIOD = 279,                  /* PERIOD  */
    SEMICOLON = 280,               /* SEMICOLON  */
    EOLN = 281,                    /* EOLN  */
    AUTO = 282,                    /* AUTO  */
    EXTRN = 283,                   /* EXTRN  */
    IF = 284,                      /* IF  */
    FOR = 285,                     /* FOR  */
    WHILE = 286,                   /* WHILE  */
    REPEAT = 287,                  /* REPEAT  */
    SWITCH = 288,                  /* SWITCH  */
    DO = 289,                      /* DO  */
    RETURN = 290,                  /* RETURN  */
    BREAK = 291,                   /* BREAK  */
    GOTO = 292,                    /* GOTO  */
    NEXT = 293,                    /* NEXT  */
    CASE = 294,                    /* CASE  */
    DEFAULT = 295,                 /* DEFAULT  */
    LOWER_THAN_ELSE = 296,         /* LOWER_THAN_ELSE  */
    ELSE = 297,                    /* ELSE  */
    NB = 298,                      /* NB  */
    ID = 299,                      /* ID  */
    LONG_ID = 300,                 /* LONG_ID  */
    TOO_LONG_ID = 301              /* TOO_LONG_ID  */
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
#define C_PAR 271
#define D_QUOTES 272
#define S_QUOTES 273
#define O_BRACKET 274
#define C_BRACKET 275
#define O_CURLY_BRACKET 276
#define C_CURLY_BRACKET 277
#define COMMA 278
#define PERIOD 279
#define SEMICOLON 280
#define EOLN 281
#define AUTO 282
#define EXTRN 283
#define IF 284
#define FOR 285
#define WHILE 286
#define REPEAT 287
#define SWITCH 288
#define DO 289
#define RETURN 290
#define BREAK 291
#define GOTO 292
#define NEXT 293
#define CASE 294
#define DEFAULT 295
#define LOWER_THAN_ELSE 296
#define ELSE 297
#define NB 298
#define ID 299
#define LONG_ID 300
#define TOO_LONG_ID 301

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 185 "y_compilator.y"
 int ival; char *sval ; 

#line 162 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
