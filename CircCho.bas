10 m=0
20 FOR j=0 TO 2
30 m=j
40 IF m=0 THEN xp=1:yp=2:yo=13:xo=13:r=6:c$="XX":ci$="00"
50 IF m=1 THEN xp=1:yp=1:yo=13:xo=21:r=12:c$="XX":ci$="00"
60 IF m=2 THEN xp=2:yp=1:yo=13:xo=41:r=12:c$="XX":ci$="00"
70 MODE m:CLS:c$="X":ts%=TIME
80 'PYTHGAORE
90 FOR i=0 TO r STEP 0.1
100 xt=SQR(r^2-i^2)
110 LOCATE xo+xp*xt,yo+yp*i:?c$:LOCATE xo+xp*xt,yo-yp*i:?c$:LOCATE xo-xp*xt,yo+yp*i:?c$:LOCATE xo-xp*xt,yo-yp*i:?c$
120 LOCATE xo+xt,yo+i:?ci$:LOCATE xo+xt,yo-yp*i:?ci$:LOCATE xo-xt,yo+i:?ci$:LOCATE xo-xt,yo-i:?ci$
130 NEXT i
140 LOCATE 1,1:?"PYTHAGORE":?"MODE ";USING "#";m:?USING "##";(TIME-ts%):?"SEC":INPUT "",k$
150 'SIN/COS - BEST RESULT
160 CLS:ts%=TIME:DEG:DIM s%(360),c%(360):r%=8*r
170 FOR n%=0 TO 360:s%(n%)=SIN(n%)*r%:c%(n%)=COS(n%)*r%:NEXT
180 FOR n%=0 TO 360:LOCATE xp*s%(n%)/8+xo,yp*c%(n%)/8+yo:?c$;:LOCATE s%(n%)/8+xo,c%(n%)/8+yo:?ci$;:NEXT n%
190 LOCATE 1,1:?"SIN/COS":?"MODE ";USING "#";m:?USING "##";(TIME-ts%):?"SEC":INPUT "",k$
200 NEXT j
210 GOTO 10
