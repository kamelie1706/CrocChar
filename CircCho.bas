10 m=0
20 IF m=o THEN xp=1:yp=2:yo=13:xo=11:r=6:c$="XX":ci$="00"
30 IF m=1 THEN xp=1:yp=1:yo=13:xo=21:r=12:c$="XX":ci$="00"
40 IF m=2 THEN xp=2:yp=1:yo=13:xo=41:r=12:c$="XX":ci$="00"
50 MODE m:CLS:c$="X":ts%=TIME
60 FOR i=0 TO r STEP 0.1
70 xt=SQR(r^2-i^2):xa=xo+xp*xt:xb=xo-xp*xt:ya=yo+yp*i:yb=yo-yp*i
80 LOCATE xa,ya:?c$:LOCATE xa,yb:?c$:LOCATE xb,ya:?c$:LOCATE xb,yb:?c$
90 NEXT i
100 IF xp<>yp THEN xp=1:yp=1:c$=ci$:GOTO 60
110 LOCATE 1,1:?"MODE ";USING "#";m:?USING "##";(TIME-ts%):?"SEC":INPUT "",k$:IF m=2 THEN m=0 ELSE m=m+1
120 GOTO 20
