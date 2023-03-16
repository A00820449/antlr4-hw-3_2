grammar Grammar;
start: 'test' EOF;

WS: [ \r\n\t]+ -> skip;
ERR_TOKEN: .;