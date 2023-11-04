10 DEG:DIM s%(90),c%(90)
20 FOR j=0 TO 2
30 m=j
40 IF m=0 THEN xp=1:yp=2:yo=13:xo=13:r=6:c$="X":ci$="0"
50 IF m=1 THEN xp=1:yp=1:yo=13:xo=21:r=12:c$="X":ci$="0"
60 IF m=2 THEN xp=2:yp=1:yo=13:xo=41:r=12:c$="X":ci$="0"
70 MODE m:CLS:ts%=INT(TIME/300)
80 'PYTHAGORE
90 FOR i=0 TO r STEP 0.022 'Higher step => increase speed / decrease quality
100 xt=SQR(r^2-i^2):yt=i
110 GOSUB 290
120 NEXT i
130 LOCATE 1,1:?"PYTHAGORE":?"MODE ";USING "#";m:?USING "##";(INT(TIME/300)-ts%):?"SEC":INPUT "",k$
140 'SIN/COS - BEST RESULT
150 CLS:ts%=INT(TIME/300):r%=8*r
160 FOR n%=0 TO 90 step 2 'Higher step => descrease speed / increase quality
170 s%(n%)=SIN(n%)*r%:c%(n%)=COS(n%)*r%
180 xt=s%(n%)/8:yt=c%(n%)/8:GOSUB 290
190 NEXT n%
200 LOCATE 1,1:?"SIN/COS":?"MODE ";USING "#";m:?USING "##";(INT(TIME/300)-ts%):?"SEC":INPUT "",k$
210 'SIN/COS - PRECALC
220 CLS:ts%=INT(TIME/300):r%=8*r
230 FOR n%=0 TO 90 step 2 'Higher step => descrease speed / increase quality
240 xt=s%(n%)/8:yt=c%(n%)/8:GOSUB 290
250 NEXT n%
260 LOCATE 1,1:?"SIN/COS":?"PRE CALC":?"MODE ";USING "#";m:?USING "##";(INT(TIME/300)-ts%):?"SEC":INPUT "",k$
270 NEXT j
280 GOTO 20
290 'common optimization
300 LOCATE xo+xp*xt,yo+yp*yt:?c$;:LOCATE xo+xt,yo+yt:?ci$;
310 LOCATE xo-xp*xt,yo+yp*yt:?c$;:LOCATE xo-xt,yo+yt:?ci$;
320 LOCATE xo-xp*xt,yo-yp*yt:?c$;:LOCATE xo-xt,yo-yt:?ci$;
330 LOCATE xo+xp*xt,yo-yp*yt:?c$;:LOCATE xo+xt,yo-yt:?ci$;
340 RETURN
