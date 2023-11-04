10 DEG:DIM s%(90),c%(90)
20 FOR j=0 TO 2
30 m=j
40 IF m=0 THEN xp=1:yp=2:yo=13:xo=13:r=6:c$="X":ci$="0"
50 IF m=1 THEN xp=1:yp=1:yo=13:xo=21:r=12:c$="X":ci$="0"
60 IF m=2 THEN xp=2:yp=1:yo=13:xo=41:r=12:c$="X":ci$="0"
70 MODE m:CLS:ts%=INT(TIME/300)
80 'PYTHAGORE
90 FOR i=0 TO r STEP 0.022
100 xt=SQR(r^2-i^2):yt=i
110 'LOCATE xo+xp*xt,yo+yp*i:?c$:LOCATE xo+xp*xt,yo-yp*i:?c$:LOCATE xo-xp*xt,yo+yp*i:?c$:LOCATE xo-xp*xt,yo-yp*i:?c$
120 'LOCATE xo+xt,yo+i:?ci$:LOCATE xo+xt,yo-i:?ci$:LOCATE xo-xt,yo+i:?ci$:LOCATE xo-xt,yo-i:?ci$
130 GOSUB 250
140 NEXT i
150 LOCATE 1,1:?"PYTHAGORE":?"MODE ";USING "#";m:?USING "##";(INT(TIME/300)-ts%):?"SEC":INPUT "",k$
160 'SIN/COS - BEST RESULT
170 CLS:ts%=INT(TIME/300):r%=8*r
180 FOR n%=0 TO 90
190 s%(n%)=SIN(n%)*r%:c%(n%)=COS(n%)*r%
200 xt=s%(n%)/8:yt=c%(n%)/8:GOSUB 250
210 NEXT n%
220 LOCATE 1,1:?"SIN/COS":?"MODE ";USING "#";m:?USING "##";(INT(TIME/300)-ts%):?"SEC":INPUT "",k$
230 NEXT j
240 GOTO 20
250 'common optimization
260 LOCATE xo+xp*xt,yo+yp*yt:?c$;:LOCATE xo+xt,yo+yt:?ci$;
270 LOCATE xo-xp*xt,yo+yp*yt:?c$;:LOCATE xo-xt,yo+yt:?ci$;
280 LOCATE xo-xp*xt,yo-yp*yt:?c$;:LOCATE xo-xt,yo-yt:?ci$;
290 LOCATE xo+xp*xt,yo-yp*yt:?c$;:LOCATE xo+xt,yo-yt:?ci$;
300 RETURN
