10 m=0
20 'PYTHAGORE
30 FOR j=0 TO 2
40 m=j
50 IF m=o THEN xp=1:yp=2:yo=13:xo=13:r=6:c$="XX":ci$="00"
60 IF m=1 THEN xp=1:yp=1:yo=13:xo=21:r=12:c$="XX":ci$="00"
70 IF m=2 THEN xp=2:yp=1:yo=13:xo=41:r=12:c$="XX":ci$="00"
80 MODE m:CLS:c$="X":ts%=TIME
90 FOR i=0 TO r STEP 0.1
100 xt=SQR(r^2-i^2):xa=xo+xp*xt:xb=xo-xp*xt:ya=yo+yp*i:yb=yo-yp*i
110 LOCATE xa,ya:?c$:LOCATE xa,yb:?c$:LOCATE xb,ya:?c$:LOCATE xb,yb:?c$
120 NEXT i
130 IF xp<>yp THEN xp=1:yp=1:c$=ci$:GOTO 90
140 LOCATE 1,1:?"PYTHAGORE":?"MODE ";USING "#";m:?USING "##";(TIME-ts%):?"SEC":INPUT "",k$:IF m=2 THEN m=0 ELSE m=m+1
150 NEXT j
160 'SIN/COS
170 CLS:ts%=TIME:DEG:DIM s%(360),c%(360):x%=320:y%=200:p%=1:m=2:r%=200
180 ORIGIN x%,y%:FOR n%=0 TO 360:s%(n%)=SIN(n%)*r%:c%(n%)=COS(n%)*r%:PLOT s%(n%),c%(n%),p%:NEXT
190 LOCATE 1,1:?"SIN/COS PLOT":?"MODE ";USING "#";m:?USING "##";(TIME-ts%):?"SEC":INPUT "",k$
200 'SIN/COS PRE CALC DRAW
220 CLS:ts%=TIME:PLOT s%(0),c%(0),p%:FOR n%=0 TO 360:DRAW s%(n%),c%(n%),p%:NEXT n%:DRAW s%(0),c%(0),p%
230 LOCATE 1,1:?"SIN/COS":?"PRE CALC DRAW":?"MODE ";USING "#";m:?USING "##";(TIME-ts%):?"SEC":INPUT "",k$
300 'SIN/COS PRE CALC CHAR - WIP NOT WORKING - NEED to convert pixel map to char location
320 'CLS:ts%=TIME:PLOT s%(0),c%(0),p%:FOR n%=0 TO 360:locate s%(n%)+1,c%(n%)+1:?c$;:NEXT n%:DRAW s%(0),c%(0),p%
330 'LOCATE 1,1:?"SIN/COS":?"PRE CALC DRAW":?"MODE ";USING "#";m:?USING "##";(TIME-ts%):?"SEC":INPUT "",k$
340 goto 20
