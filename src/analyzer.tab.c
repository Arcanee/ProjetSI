/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "analyzer.y"

#include <stdio.h>
#include <stdlib.h>
#include "../lib/include/sym_tab.h"
#include "../lib/include/asm_tab.h"
#include "../lib/include/fun_tab.h"

#define NIL -1 //Refers to a negligible parameter in the asm instruction table.

#define ASM_AFF 0
#define ASM_COP 1
#define ASM_ADD 2
#define ASM_SUB 3
#define ASM_MUL 4
#define ASM_DIV 5
#define ASM_B 6
#define ASM_NIL 7
#define ASM_CMP 8
#define ASM_BEQ 9
#define ASM_BNE 10
#define ASM_RET 11
#define ASM_PSH 12
#define ASM_POP 13
#define ASM_BF 14
#define ASM_STR 15
#define ASM_LDR 16
#define ASM_BN 17
#define ASM_BNZ 18
#define ASM_BP 19
#define ASM_BSP 20

#line 103 "analyzer.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "analyzer.tab.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_tID = 3,                        /* tID  */
  YYSYMBOL_tNB = 4,                        /* tNB  */
  YYSYMBOL_tIF = 5,                        /* tIF  */
  YYSYMBOL_tWHILE = 6,                     /* tWHILE  */
  YYSYMBOL_tELSE = 7,                      /* tELSE  */
  YYSYMBOL_tPRINT = 8,                     /* tPRINT  */
  YYSYMBOL_tRETURN = 9,                    /* tRETURN  */
  YYSYMBOL_tINT = 10,                      /* tINT  */
  YYSYMBOL_tVOID = 11,                     /* tVOID  */
  YYSYMBOL_tLT = 12,                       /* tLT  */
  YYSYMBOL_tLE = 13,                       /* tLE  */
  YYSYMBOL_tGT = 14,                       /* tGT  */
  YYSYMBOL_tGE = 15,                       /* tGE  */
  YYSYMBOL_tEQ = 16,                       /* tEQ  */
  YYSYMBOL_tNEQ = 17,                      /* tNEQ  */
  YYSYMBOL_tASSIGN = 18,                   /* tASSIGN  */
  YYSYMBOL_tADD = 19,                      /* tADD  */
  YYSYMBOL_tSUB = 20,                      /* tSUB  */
  YYSYMBOL_tDIV = 21,                      /* tDIV  */
  YYSYMBOL_tMUL = 22,                      /* tMUL  */
  YYSYMBOL_tAND = 23,                      /* tAND  */
  YYSYMBOL_tOR = 24,                       /* tOR  */
  YYSYMBOL_tNOT = 25,                      /* tNOT  */
  YYSYMBOL_tLBRACE = 26,                   /* tLBRACE  */
  YYSYMBOL_tRBRACE = 27,                   /* tRBRACE  */
  YYSYMBOL_tLPAR = 28,                     /* tLPAR  */
  YYSYMBOL_tRPAR = 29,                     /* tRPAR  */
  YYSYMBOL_tSEMI = 30,                     /* tSEMI  */
  YYSYMBOL_tCOMMA = 31,                    /* tCOMMA  */
  YYSYMBOL_YYACCEPT = 32,                  /* $accept  */
  YYSYMBOL_functions = 33,                 /* functions  */
  YYSYMBOL_function = 34,                  /* function  */
  YYSYMBOL_35_1 = 35,                      /* $@1  */
  YYSYMBOL_36_2 = 36,                      /* $@2  */
  YYSYMBOL_type = 37,                      /* type  */
  YYSYMBOL_params = 38,                    /* params  */
  YYSYMBOL_params_void = 39,               /* params_void  */
  YYSYMBOL_params_full = 40,               /* params_full  */
  YYSYMBOL_41_3 = 41,                      /* $@3  */
  YYSYMBOL_block = 42,                     /* block  */
  YYSYMBOL_43_4 = 43,                      /* $@4  */
  YYSYMBOL_instructions = 44,              /* instructions  */
  YYSYMBOL_instruction = 45,               /* instruction  */
  YYSYMBOL_ifheader = 46,                  /* ifheader  */
  YYSYMBOL_47_5 = 47,                      /* $@5  */
  YYSYMBOL_condins = 48,                   /* condins  */
  YYSYMBOL_49_6 = 49,                      /* $@6  */
  YYSYMBOL_expr = 50,                      /* expr  */
  YYSYMBOL_term = 51,                      /* term  */
  YYSYMBOL_condition = 52,                 /* condition  */
  YYSYMBOL_loop = 53,                      /* loop  */
  YYSYMBOL_54_7 = 54,                      /* $@7  */
  YYSYMBOL_55_8 = 55,                      /* $@8  */
  YYSYMBOL_print = 56,                     /* print  */
  YYSYMBOL_assign = 57,                    /* assign  */
  YYSYMBOL_declar = 58,                    /* declar  */
  YYSYMBOL_59_9 = 59,                      /* $@9  */
  YYSYMBOL_60_10 = 60,                     /* $@10  */
  YYSYMBOL_funcreturn = 61,                /* funcreturn  */
  YYSYMBOL_funccall = 62,                  /* funccall  */
  YYSYMBOL_63_11 = 63,                     /* $@11  */
  YYSYMBOL_callparams = 64,                /* callparams  */
  YYSYMBOL_callparams_void = 65,           /* callparams_void  */
  YYSYMBOL_callparams_full = 66            /* callparams_full  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_int8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  6
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   116

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  32
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  35
/* YYNRULES -- Number of rules.  */
#define YYNRULES  71
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  122

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   286


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,    68,    68,    69,    73,    73,    73,    77,    78,    82,
      83,    87,    88,    92,    93,    93,    97,    97,   101,   102,
     106,   107,   108,   109,   110,   111,   112,   113,   114,   118,
     118,   130,   132,   131,   143,   144,   150,   156,   162,   168,
     169,   170,   181,   184,   187,   191,   202,   214,   222,   230,
     238,   246,   264,   282,   290,   300,   301,   300,   311,   314,
     321,   322,   322,   322,   334,   341,   341,   352,   353,   357,
     361,   362
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "tID", "tNB", "tIF",
  "tWHILE", "tELSE", "tPRINT", "tRETURN", "tINT", "tVOID", "tLT", "tLE",
  "tGT", "tGE", "tEQ", "tNEQ", "tASSIGN", "tADD", "tSUB", "tDIV", "tMUL",
  "tAND", "tOR", "tNOT", "tLBRACE", "tRBRACE", "tLPAR", "tRPAR", "tSEMI",
  "tCOMMA", "$accept", "functions", "function", "$@1", "$@2", "type",
  "params", "params_void", "params_full", "$@3", "block", "$@4",
  "instructions", "instruction", "ifheader", "$@5", "condins", "$@6",
  "expr", "term", "condition", "loop", "$@7", "$@8", "print", "assign",
  "declar", "$@9", "$@10", "funcreturn", "funccall", "$@11", "callparams",
  "callparams_void", "callparams_full", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-25)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-62)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int8 yypact[] =
{
      14,   -25,   -25,    16,    14,    15,   -25,   -25,     4,   -25,
      24,    41,   -25,    26,   -25,   -25,    25,   -25,   -25,    31,
      35,   -25,   -25,   -25,     3,   -11,    30,   -25,    32,    18,
      67,   -25,   -25,    44,     3,    65,   -25,   -25,    43,    61,
      63,    64,    66,    18,   -25,    11,    70,    18,    71,   -25,
      18,    18,    18,   -18,   -25,   -25,    87,   -25,   -25,   -25,
     -25,   -25,   -25,   -25,   -25,   -18,    18,    18,    62,    77,
      11,    68,    19,    19,    82,    18,    18,    18,    18,    89,
      31,    28,    79,   -25,   -25,   -18,    18,    18,    18,    18,
      18,    18,    18,    18,   -25,   -25,   -25,   -25,    19,    19,
     -25,   -25,   -25,   -25,    18,   -25,   -18,   -18,   -18,   -18,
     -18,   -18,   -18,   -18,    31,    80,    18,   -25,   -25,    31,
     -18,   -25
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       2,     7,     8,     0,     2,     0,     1,     3,     0,     4,
      11,     0,    12,     0,     9,    10,    13,     5,    14,     0,
       0,    16,     6,    15,    18,     0,     0,    55,     0,     0,
       0,    28,    27,     0,    18,    31,    26,    25,     0,     0,
       0,     0,     0,     0,    65,     0,     0,     0,    42,    43,
       0,     0,     0,    64,    34,    44,    60,    17,    19,    32,
      20,    21,    22,    23,    24,    59,    69,     0,    45,     0,
       0,     0,    40,    41,     0,     0,     0,     0,     0,     0,
       0,    70,     0,    67,    68,    46,     0,     0,     0,     0,
       0,     0,     0,     0,    29,    56,    58,    39,    35,    36,
      38,    37,    62,    33,     0,    66,    47,    48,    49,    50,
      53,    54,    52,    51,     0,     0,     0,    71,    30,     0,
      63,    57
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int8 yypgoto[] =
{
     -25,   106,   -25,   -25,   -25,   -25,   -25,   -25,    92,   -25,
     -19,   -25,    81,   -25,   -25,   -25,   -25,   -25,   -24,   -25,
      46,   -25,   -25,   -25,   -25,   -25,   -25,   -25,   -25,   -25,
     -14,   -25,   -25,   -25,     9
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int8 yydefgoto[] =
{
       0,     3,     4,    10,    19,     5,    13,    14,    15,    20,
      32,    24,    33,    34,    35,   114,    36,    80,    68,    54,
      69,    37,    46,   115,    38,    39,    40,    79,   116,    41,
      55,    66,    82,    83,    84
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_int8 yytable[] =
{
      22,    75,    76,    77,    78,    53,    25,    43,    26,    27,
      42,    28,    29,    30,    48,    49,     6,    44,     8,    65,
      42,    48,    49,    71,     1,     2,    72,    73,    74,    21,
      50,    51,     9,    31,    11,    12,    67,    50,    51,    52,
      77,    78,    81,    85,    16,    11,    52,    75,    76,    77,
      78,    98,    99,   100,   101,    17,    18,    21,    45,   104,
      47,   103,   106,   107,   108,   109,   110,   111,   112,   113,
      56,    57,    59,    60,    86,    87,    88,    89,    90,    91,
      81,    75,    76,    77,    78,    92,    93,    75,    76,    77,
      78,    61,   120,    62,    63,   118,    64,    96,    70,    44,
     121,    75,    76,    77,    78,   -61,    94,   102,   105,   119,
       7,    97,    23,   117,     0,    58,    95
};

static const yytype_int8 yycheck[] =
{
      19,    19,    20,    21,    22,    29,     3,    18,     5,     6,
      24,     8,     9,    10,     3,     4,     0,    28,     3,    43,
      34,     3,     4,    47,    10,    11,    50,    51,    52,    26,
      19,    20,    28,    30,    10,    11,    25,    19,    20,    28,
      21,    22,    66,    67,     3,    10,    28,    19,    20,    21,
      22,    75,    76,    77,    78,    29,    31,    26,    28,    31,
      28,    80,    86,    87,    88,    89,    90,    91,    92,    93,
       3,    27,     7,    30,    12,    13,    14,    15,    16,    17,
     104,    19,    20,    21,    22,    23,    24,    19,    20,    21,
      22,    30,   116,    30,    30,   114,    30,    29,    28,    28,
     119,    19,    20,    21,    22,    18,    29,    18,    29,    29,
       4,    29,    20,   104,    -1,    34,    70
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    10,    11,    33,    34,    37,     0,    33,     3,    28,
      35,    10,    11,    38,    39,    40,     3,    29,    31,    36,
      41,    26,    42,    40,    43,     3,     5,     6,     8,     9,
      10,    30,    42,    44,    45,    46,    48,    53,    56,    57,
      58,    61,    62,    18,    28,    28,    54,    28,     3,     4,
      19,    20,    28,    50,    51,    62,     3,    27,    44,     7,
      30,    30,    30,    30,    30,    50,    63,    25,    50,    52,
      28,    50,    50,    50,    50,    19,    20,    21,    22,    59,
      49,    50,    64,    65,    66,    50,    12,    13,    14,    15,
      16,    17,    23,    24,    29,    52,    29,    29,    50,    50,
      50,    50,    18,    42,    31,    29,    50,    50,    50,    50,
      50,    50,    50,    50,    47,    55,    60,    66,    42,    29,
      50,    42
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    32,    33,    33,    35,    36,    34,    37,    37,    38,
      38,    39,    39,    40,    41,    40,    43,    42,    44,    44,
      45,    45,    45,    45,    45,    45,    45,    45,    45,    47,
      46,    48,    49,    48,    50,    50,    50,    50,    50,    50,
      50,    50,    51,    51,    51,    52,    52,    52,    52,    52,
      52,    52,    52,    52,    52,    54,    55,    53,    56,    57,
      58,    59,    60,    58,    61,    63,    62,    64,    64,    65,
      66,    66
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     0,     2,     0,     0,     8,     1,     1,     1,
       1,     0,     1,     2,     0,     5,     0,     4,     0,     2,
       2,     2,     2,     2,     2,     1,     1,     1,     1,     0,
       6,     1,     0,     4,     1,     3,     3,     3,     3,     3,
       2,     2,     1,     1,     1,     1,     2,     3,     3,     3,
       3,     3,     3,     3,     3,     0,     0,     7,     4,     3,
       2,     0,     0,     6,     2,     0,     5,     1,     1,     0,
       1,     3
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 4: /* $@1: %empty  */
#line 73 "analyzer.y"
                   {sym_inc_depth(); sym_add("?ADDR"); sym_add("?VAL");}
#line 1238 "analyzer.tab.c"
    break;

  case 5: /* $@2: %empty  */
#line 73 "analyzer.y"
                                                                                      {fun_add((yyvsp[-4].s), asm_current(), (yyvsp[-5].f_type));}
#line 1244 "analyzer.tab.c"
    break;

  case 6: /* function: type tID tLPAR $@1 params tRPAR $@2 block  */
#line 73 "analyzer.y"
                                                                                                                              {asm_add(ASM_RET, 0, NIL, NIL, 1); sym_clear();}
#line 1250 "analyzer.tab.c"
    break;

  case 7: /* type: tINT  */
#line 77 "analyzer.y"
         {(yyval.f_type) = 1;}
#line 1256 "analyzer.tab.c"
    break;

  case 8: /* type: tVOID  */
#line 78 "analyzer.y"
          {(yyval.f_type) = 0;}
#line 1262 "analyzer.tab.c"
    break;

  case 13: /* params_full: tINT tID  */
#line 92 "analyzer.y"
             {sym_add((yyvsp[0].s));}
#line 1268 "analyzer.tab.c"
    break;

  case 14: /* $@3: %empty  */
#line 93 "analyzer.y"
                    {sym_add((yyvsp[-1].s));}
#line 1274 "analyzer.tab.c"
    break;

  case 16: /* $@4: %empty  */
#line 97 "analyzer.y"
           {sym_inc_depth();}
#line 1280 "analyzer.tab.c"
    break;

  case 17: /* block: tLBRACE $@4 instructions tRBRACE  */
#line 97 "analyzer.y"
                                                   {sym_clear();}
#line 1286 "analyzer.tab.c"
    break;

  case 29: /* $@5: %empty  */
#line 118 "analyzer.y"
                             {(yyvsp[-3].branch_info).branch_line = asm_current()-1;
                              (yyvsp[-3].branch_info).was_and = (yyvsp[-1].is_and);
                              (yyvsp[-3].branch_info).and_branch_line = asm_current()-3;}
#line 1294 "analyzer.tab.c"
    break;

  case 30: /* ifheader: tIF tLPAR condition tRPAR $@5 block  */
#line 122 "analyzer.y"
        {(yyvsp[-5].branch_info).end = asm_current();
        (yyval.branch_info).end = (yyvsp[-5].branch_info).end;
        (yyval.branch_info).branch_line = (yyvsp[-5].branch_info).branch_line;
        asm_update((yyvsp[-5].branch_info).branch_line, 1, (yyvsp[-5].branch_info).end); 
        if ((yyvsp[-3].is_and)) {asm_update((yyvsp[-5].branch_info).and_branch_line, 1, (yyvsp[-5].branch_info).end);}}
#line 1304 "analyzer.tab.c"
    break;

  case 32: /* $@6: %empty  */
#line 132 "analyzer.y"
            {asm_add(ASM_B, NIL, NIL, NIL, 1); 
            (yyvsp[-1].branch_info).end = asm_current(); 
            asm_update((yyvsp[-1].branch_info).branch_line, 1, (yyvsp[-1].branch_info).end); //update of the if to go directly in the ELSE block if needed
            if ((yyvsp[-1].branch_info).was_and) {asm_update((yyvsp[-1].branch_info).and_branch_line, 1, (yyvsp[-1].branch_info).end);}}
#line 1313 "analyzer.tab.c"
    break;

  case 33: /* condins: ifheader tELSE $@6 block  */
#line 137 "analyzer.y"
          {(yyvsp[-2].branch_info).end = asm_current(); 
            asm_update((yyvsp[-3].branch_info).end-1, 1, (yyvsp[-2].branch_info).end);}
#line 1320 "analyzer.tab.c"
    break;

  case 35: /* expr: expr tADD expr  */
#line 144 "analyzer.y"
                   {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_ADD, 0, 0, 1, 3);
                    asm_add(ASM_STR, 0, sym_next_last(), NIL, 2); 
                    sym_remove_last();}
#line 1330 "analyzer.tab.c"
    break;

  case 36: /* expr: expr tSUB expr  */
#line 150 "analyzer.y"
                   {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_SUB, 0, 0, 1, 3);
                    asm_add(ASM_STR, 0, sym_next_last(), NIL, 2); 
                    sym_remove_last();}
#line 1340 "analyzer.tab.c"
    break;

  case 37: /* expr: expr tMUL expr  */
#line 156 "analyzer.y"
                   {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_MUL, 0, 0, 1, 3);
                    asm_add(ASM_STR, 0, sym_next_last(), NIL, 2); 
                    sym_remove_last();}
#line 1350 "analyzer.tab.c"
    break;

  case 38: /* expr: expr tDIV expr  */
#line 162 "analyzer.y"
                   {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_DIV, 0, 0, 1, 3);
                    asm_add(ASM_STR, 0, sym_next_last(), NIL, 2); 
                    sym_remove_last();}
#line 1360 "analyzer.tab.c"
    break;

  case 41: /* expr: tSUB expr  */
#line 170 "analyzer.y"
              {sym_add("_"); 
               asm_add(ASM_AFF, 0, 0, NIL, 2);
               asm_add(ASM_STR, 0, sym_last(), NIL, 2);
               asm_add(ASM_LDR, 0, sym_last(), NIL, 2);
               asm_add(ASM_LDR, 1, sym_next_last(), NIL, 2);
               asm_add(ASM_SUB, 0, 0, 1, 3);
               asm_add(ASM_STR, 0, sym_next_last(), NIL, 2);
               sym_remove_last();}
#line 1373 "analyzer.tab.c"
    break;

  case 42: /* term: tID  */
#line 181 "analyzer.y"
        {sym_add("_");
         asm_add(ASM_LDR, 0, sym_get_addr((yyvsp[0].s)), NIL, 2); 
         asm_add(ASM_STR, 0, sym_last(), NIL, 2); }
#line 1381 "analyzer.tab.c"
    break;

  case 43: /* term: tNB  */
#line 184 "analyzer.y"
        {sym_add("_"); 
         asm_add(ASM_AFF, 0, (yyvsp[0].i), NIL, 2);
         asm_add(ASM_STR, 0, sym_last(), NIL, 2);}
#line 1389 "analyzer.tab.c"
    break;

  case 45: /* condition: expr  */
#line 191 "analyzer.y"
         {sym_add("_"); 
          asm_add(ASM_AFF, 0, 0, NIL, 2);
          asm_add(ASM_STR, 0, sym_last(), NIL, 2);
          asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
          asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
          asm_add(ASM_CMP, 0, 1, NIL, 2);
          asm_add(ASM_BEQ, NIL, NIL, NIL, 1);
          sym_remove_last();
          sym_remove_last(); // (expr) <=> (expr != 0)
          (yyval.is_and) = 0;}
#line 1404 "analyzer.tab.c"
    break;

  case 46: /* condition: tNOT expr  */
#line 202 "analyzer.y"
              {sym_add("_"); 
               asm_add(ASM_AFF, 0, 0, NIL, 2);
               asm_add(ASM_STR, 0, sym_last(), NIL, 2);
               asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
               asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
               asm_add(ASM_CMP, 0, 1, NIL, 2);
               asm_add(ASM_BNE, NIL, NIL, NIL, 1);
               sym_remove_last();
               sym_remove_last(); // (!expr) <=> (expr == 0)
               (yyval.is_and) = 0;}
#line 1419 "analyzer.tab.c"
    break;

  case 47: /* condition: expr tLT expr  */
#line 214 "analyzer.y"
                  {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BP, NIL, NIL, NIL, 1); //0 is considered positive
                   sym_remove_last();
                   sym_remove_last();
                   (yyval.is_and) = 0;}
#line 1431 "analyzer.tab.c"
    break;

  case 48: /* condition: expr tLE expr  */
#line 222 "analyzer.y"
                  {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BSP, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   (yyval.is_and) = 0;}
#line 1443 "analyzer.tab.c"
    break;

  case 49: /* condition: expr tGT expr  */
#line 230 "analyzer.y"
                  {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BNZ, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   (yyval.is_and) = 0;}
#line 1455 "analyzer.tab.c"
    break;

  case 50: /* condition: expr tGE expr  */
#line 238 "analyzer.y"
                  {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BN, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   (yyval.is_and) = 0;}
#line 1467 "analyzer.tab.c"
    break;

  case 51: /* condition: expr tOR expr  */
#line 246 "analyzer.y"
                  {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2); //CMP e1 & 0
                   sym_add("_");
                   asm_add(ASM_AFF, 1, 0, NIL, 2);
                   asm_add(ASM_STR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BNE, asm_current()+3, NIL, NIL, 1);

                   asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2); //CMP e2 & 0
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BEQ, NIL, NIL, NIL, 1);

                   sym_remove_last(); //remove 0, e2, e1
                   sym_remove_last();
                   sym_remove_last();
                   (yyval.is_and) = 0;}
#line 1489 "analyzer.tab.c"
    break;

  case 52: /* condition: expr tAND expr  */
#line 264 "analyzer.y"
                   {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2); //CMP e1 & 0
                    sym_add("_");
                    asm_add(ASM_AFF, 1, 0, NIL, 2);
                    asm_add(ASM_STR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_CMP, 0, 1, NIL, 2);
                    asm_add(ASM_BEQ, NIL, NIL, NIL, 1);

                    asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2); //CMP e2 & 0
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_CMP, 0, 1, NIL, 2);
                    asm_add(ASM_BEQ, NIL, NIL, NIL, 1);

                    sym_remove_last(); //remove 0, e2, e1
                    sym_remove_last();
                    sym_remove_last();
                    (yyval.is_and) = 1;}
#line 1511 "analyzer.tab.c"
    break;

  case 53: /* condition: expr tEQ expr  */
#line 282 "analyzer.y"
                  {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                   asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                   asm_add(ASM_CMP, 0, 1, NIL, 2);
                   asm_add(ASM_BNE, NIL, NIL, NIL, 1);
                   sym_remove_last();
                   sym_remove_last();
                   (yyval.is_and) = 0;}
#line 1523 "analyzer.tab.c"
    break;

  case 54: /* condition: expr tNEQ expr  */
#line 290 "analyzer.y"
                   {asm_add(ASM_LDR, 0, sym_next_last(), NIL, 2);
                    asm_add(ASM_LDR, 1, sym_last(), NIL, 2);
                    asm_add(ASM_CMP, 0, 1, NIL, 2);
                    asm_add(ASM_BEQ, NIL, NIL, NIL, 1);
                    sym_remove_last();
                    sym_remove_last();
                    (yyval.is_and) = 0;}
#line 1535 "analyzer.tab.c"
    break;

  case 55: /* $@7: %empty  */
#line 300 "analyzer.y"
           {(yyvsp[0].branch_info).begin = asm_current();}
#line 1541 "analyzer.tab.c"
    break;

  case 56: /* $@8: %empty  */
#line 301 "analyzer.y"
                    { (yyvsp[-3].branch_info).branch_line = asm_current()-1;
                      (yyvsp[-3].branch_info).and_branch_line = asm_current()-3;}
#line 1548 "analyzer.tab.c"
    break;

  case 57: /* loop: tWHILE $@7 tLPAR condition $@8 tRPAR block  */
#line 304 "analyzer.y"
                {asm_add(ASM_B, (yyvsp[-6].branch_info).begin, NIL, NIL, 1);
                (yyvsp[-6].branch_info).end = asm_current();
                asm_update((yyvsp[-6].branch_info).branch_line, 1, (yyvsp[-6].branch_info).end);
                if ((yyvsp[-3].is_and)) {asm_update((yyvsp[-6].branch_info).and_branch_line, 1, (yyvsp[-6].branch_info).end);}}
#line 1557 "analyzer.tab.c"
    break;

  case 59: /* assign: tID tASSIGN expr  */
#line 314 "analyzer.y"
                     {sym_set_init((yyvsp[-2].s)); 
                      asm_add(ASM_LDR, 0, sym_last(), NIL, 2);
                      asm_add(ASM_STR, 0, sym_get_addr((yyvsp[-2].s)), NIL, 2);  
                      sym_remove_last();}
#line 1566 "analyzer.tab.c"
    break;

  case 60: /* declar: tINT tID  */
#line 321 "analyzer.y"
             {sym_add((yyvsp[0].s));}
#line 1572 "analyzer.tab.c"
    break;

  case 61: /* $@9: %empty  */
#line 322 "analyzer.y"
             {sym_add((yyvsp[0].s));}
#line 1578 "analyzer.tab.c"
    break;

  case 62: /* $@10: %empty  */
#line 322 "analyzer.y"
                                    {sym_set_init((yyvsp[-2].s));}
#line 1584 "analyzer.tab.c"
    break;

  case 63: /* declar: tINT tID $@9 tASSIGN $@10 expr  */
#line 322 "analyzer.y"
                                                             {asm_add(ASM_LDR, 0, sym_last(), NIL, 2);
                                                              asm_add(ASM_STR, 0, sym_get_addr((yyvsp[-4].s)), NIL, 2); 
                                                              sym_remove_last();}
#line 1592 "analyzer.tab.c"
    break;

  case 64: /* funcreturn: tRETURN expr  */
#line 334 "analyzer.y"
                 {asm_add(ASM_LDR, 0, sym_last(), NIL, 2);
                  asm_add(ASM_STR, 0, sym_get_addr("?VAL"), NIL, 2); 
                  sym_remove_last();
                  asm_add(ASM_RET, 0, NIL, NIL, 1);}
#line 1601 "analyzer.tab.c"
    break;

  case 65: /* $@11: %empty  */
#line 341 "analyzer.y"
              {asm_set_push(sym_last()+1);
               sym_add("!ADDR"); sym_add("!VAL");}
#line 1608 "analyzer.tab.c"
    break;

  case 66: /* funccall: tID tLPAR $@11 callparams tRPAR  */
#line 342 "analyzer.y"
                                                                    {asm_add(ASM_PSH, asm_push(), NIL, NIL, 1);
                                                                     asm_add(ASM_BF, fun_get_addr((yyvsp[-4].s)), NIL, NIL, 1);
                                                                     asm_add(ASM_POP, asm_push(), NIL, NIL, 1);
                                                                     asm_add(ASM_LDR, 0, sym_get_addr("!VAL"), NIL, 2);
                                                                     asm_add(ASM_STR, 0, sym_get_addr("!ADDR"), NIL, 2);
                                                                     sym_remove_lasts(sym_last()+1 - asm_push());
                                                                     sym_add("_");}
#line 1620 "analyzer.tab.c"
    break;


#line 1624 "analyzer.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 365 "analyzer.y"


void yyerror(const char *msg) {
  fprintf(stderr, "error: %s\n", msg);
  exit(1);
}

int main(void) {

  asm_add(ASM_B, NIL, NIL, NIL, 1);

  printf("-1 - [START OF PROGRAM]\n");

  sym_init_tab();
  yyparse();

  asm_update(0, 1, fun_get_addr("main"));

  asm_print_tab();
}
