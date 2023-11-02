10 m=0:ci$="0"
20 IF m=o THEN xp=1:yp=2:yo=13:xo=11:r=6
30 IF m=1 THEN xp=1:yp=1:yo=13:xo=21:r=12
40 IF m=2 THEN xp=2:yp=1:yo=13:xo=41:r=12
50 MODE m:CLS:c$="X"
60 FOR i=0 TO r STEP 0.01
70 xa=xo+xp*SQR(r^2-i^2)
80 xb=xo-xp*SQR(r^2-i^2)
90 ya=yo+yp*i
100 yb=yo-yp*i
110 LOCATE xa,ya:?c$:LOCATE xa,yb:?c$:LOCATE xb,ya:?c$:LOCATE xb,yb:?c$
120 NEXT i
130 if xp<>yp then xp=1:yp=1:c$=ci$:goto 60
140 LOCATE 1,1:?"MODE ";using "#";m;:INPUT "",k$:IF m=2 THEN m=0 ELSE m=m+1
150 GOTO 20
