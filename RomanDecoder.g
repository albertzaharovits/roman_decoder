/* Albert Zaharovits albert.zaharovits@gmail.com
 * 18.02.2014
 * Roman numbers decoder ANTLR grammar
 */
grammar RomanDecoder;

number returns [int value]
@init{ 
	$value = 0; 
}
	: ((THOUSAND {$value += 1000;})* (h=hundreds_ {$value += $h.value;})? (t=tens_ {$value += $t.value;})? (u=units_ {$value += $u.value;})? NEWLINE {System.out.println($value);$value=0;})*
	;
		
hundreds_ returns [int value]
	: HUNDRED {$value = 100;} (HUNDRED5 {$value = 400;} | THOUSAND {$value = 900;} | (HUNDRED {$value = 200;} (HUNDRED {$value = 300;})?))?
	| HUNDRED5 {$value = 500;} (HUNDRED {$value = 600;} (HUNDRED {$value = 700;} (HUNDRED {$value = 800;})?)?)?
	;
	
tens_ returns [int value]
	: TEN {$value = 10;} (TEN5 {$value = 40;} | HUNDRED {$value = 90;} | (TEN {$value = 20;} (TEN {$value = 30;})?))?
	| TEN5 {$value = 50;} (TEN {$value = 60;} (TEN {$value = 70;} (TEN {$value = 80;})?)?)?
	;

units_ returns [int value]
	: ONE {$value = 1;} (ONE5 {$value = 4;} | TEN {$value = 9;} | (ONE {$value = 2;} (ONE {$value = 3;})?))?
	| ONE5 {$value = 5;} (ONE {$value = 6;} (ONE {$value = 7;} (ONE {$value = 8;})?)?)?
	;

ONE 	:	 'I';
ONE5	:	 'V';
TEN	:	 'X';
TEN5	:	 'L';
HUNDRED	:	 'C';
HUNDRED5:	 'D';
THOUSAND:	 'M';

NEWLINE : [\r\n]+;
