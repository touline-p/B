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
    EQUAL = 258,                   /* EQUAL  */
    PLUS = 259,                    /* PLUS  */
    MINUS = 260,                   /* MINUS  */
    ASTE = 261,                    /* ASTE  */
    SLASH = 262,                   /* SLASH  */
    PERCENT = 263,                 /* PERCENT  */
    O_PAR = 264,                   /* O_PAR  */
    C_PAR = 265,                   /* C_PAR  */
    D_QUOTES = 266,                /* D_QUOTES  */
    S_QUOTES = 267,                /* S_QUOTES  */
    O_BRACKET = 268,               /* O_BRACKET  */
    C_BRACKET = 269,               /* C_BRACKET  */
    O_CURLY_BRACKET = 270,         /* O_CURLY_BRACKET  */
    C_CURLY_BRACKET = 271,         /* C_CURLY_BRACKET  */
    COMMA = 272,                   /* COMMA  */
    PERIOD = 273,                  /* PERIOD  */
    SEMICOLON = 274,               /* SEMICOLON  */
    EOLN = 275,                    /* EOLN  */
    AUTO = 276,                    /* AUTO  */
    EXTRN = 277,                   /* EXTRN  */
    IF = 278,                      /* IF  */
    FOR = 279,                     /* FOR  */
    WHILE = 280,                   /* WHILE  */
    REPEAT = 281,                  /* REPEAT  */
    SWITCH = 282,                  /* SWITCH  */
    DO = 283,                      /* DO  */
    RETURN = 284,                  /* RETURN  */
    BREAK = 285,                   /* BREAK  */
    GOTO = 286,                    /* GOTO  */
    NEXT = 287,                    /* NEXT  */
    CASE = 288,                    /* CASE  */
    DEFAULT = 289,                 /* DEFAULT  */
    LOWER_THAN_ELSE = 290,         /* LOWER_THAN_ELSE  */
    ELSE = 291,                    /* ELSE  */
    NB = 292,                      /* NB  */
    ID = 293,                      /* ID  */
    LONG_ID = 294,                 /* LONG_ID  */
    TOO_LONG_ID = 295              /* TOO_LONG_ID  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define EQUAL 258
#define PLUS 259
#define MINUS 260
#define ASTE 261
#define SLASH 262
#define PERCENT 263
#define O_PAR 264
#define C_PAR 265
#define D_QUOTES 266
#define S_QUOTES 267
#define O_BRACKET 268
#define C_BRACKET 269
#define O_CURLY_BRACKET 270
#define C_CURLY_BRACKET 271
#define COMMA 272
#define PERIOD 273
#define SEMICOLON 274
#define EOLN 275
#define AUTO 276
#define EXTRN 277
#define IF 278
#define FOR 279
#define WHILE 280
#define REPEAT 281
#define SWITCH 282
#define DO 283
#define RETURN 284
#define BREAK 285
#define GOTO 286
#define NEXT 287
#define CASE 288
#define DEFAULT 289
#define LOWER_THAN_ELSE 290
#define ELSE 291
#define NB 292
#define ID 293
#define LONG_ID 294
#define TOO_LONG_ID 295

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 166 "y_compilator.y"
 int ival; char *sval ; 

#line 150 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
