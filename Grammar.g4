grammar Grammar;
start: program EOF;

program: 'program' ID ':' vars? block;

vars: 'var' (ID (',' ID)* ':' type ';')+;

type: 'int' | 'float';

block: '{' statement* '}';

statement: conditional | printing | assignment;

assignment: ID '=' expression ';';

conditional: 'if' '(' expression ')' block ('else' block)? ';';

printing: 'print' '(' printable (',' printable)* ')' ';';
printable: CTE_STR | expression;

expression: exp (exp_op exp)?;
exp_op: '<' | '>' | '<>';

exp: term (term_op term)*;
term_op: '+' | '-';

term: factor (factor_op factor)*;
factor_op: '*' | '/';

factor: '(' expression ')' | unary_op? var_cte;
unary_op: '+' | '-';

var_cte: CTE_F | CTE_L | ID;

// TOKENS
fragment DIGIT: [0-9];
fragment LETTER: [A-Za-z];
fragment ESCAPED_CHAR: '\\'.;

ID: (LETTER|'_')(LETTER|DIGIT|'_')*;
CTE_F: DIGIT+'.'DIGIT+([Ee][-+]?DIGIT+)?;
CTE_L: DIGIT+;
CTE_STR: '"'(ESCAPED_CHAR|~[\\"])*'"';

WS: [ \r\n\t]+ -> skip;
ERR_TOKEN: .;