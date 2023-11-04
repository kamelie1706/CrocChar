10 DEG:DIM s%(90),c%(90),rt(30),r$(30):ri%=0:scp=3:pp=0.3:louvre=0
20 FOR j=0 TO 2
30 m=j
40 IF m=0 THEN xp=1:yp=2:yo=13:xo=13:r=6:c$="X":ci$="0"
50 IF m=1 THEN xp=1:yp=1:yo=13:xo=21:r=12:c$="X":ci$="0"
60 IF m=2 THEN xp=2:yp=1:yo=13:xo=41:r=12:c$="X":ci$="0"
70 MODE m:r%=8*r
80 'PYTHAGORE
90 CLS:ts%=INT(TIME/300):ri%=ri%+1:r$(ri%)="MODE "+STR$(m)+" PYTHAGORE "
100 FOR i=0 TO r STEP pp 'Higher step => increase speed / decrease quality
110 xt=SQR(r^2-i^2):yt=i
120 GOSUB 490
130 NEXT i
140 rt(ri%)=(INT(TIME/300)-ts%)
150 IF louvre THEN LOCATE 1,1:?"PYTHAGORE":?"MODE ";USING "#";m:?USING "##";rt(ri%):?"SEC":INPUT "",k$
160 'SIN/COS - BEST RESULT
170 CLS:ts%=INT(TIME/300):ri%=ri%+1:r$(ri%)="MODE "+STR$(m)+" SIN/COS "
180 FOR n%=0 TO 90 STEP scp 'Higher step => descrease speed / increase quality
190 s%(n%)=SIN(n%)*r%:c%(n%)=COS(n%)*r%
200 xt=s%(n%)/8:yt=c%(n%)/8:GOSUB 490
210 NEXT n%
220 rt(ri%)=(INT(TIME/300)-ts%)
230 IF louvre THEN LOCATE 1,1:?"SIN/COS":?"MODE ";USING "#";m:?USING "##";rt(ri%):?"SEC":INPUT "",k$
240 'SIN/COS - PRECALC
250 CLS:ts%=INT(TIME/300):ri%=ri%+1:r$(ri%)="MODE "+STR$(m)+" SIN/COS PRECALC "
260 FOR n%=0 TO 90 STEP scp 'Higher step => descrease speed / increase quality
270 xt=s%(n%)/8:yt=c%(n%)/8:GOSUB 490
280 NEXT n%
290 rt(ri%)=(INT(TIME/300)-ts%)
300 IF louvre THEN LOCATE 1,1:?"SIN/COS":?"PRE CALC":?"MODE ";USING "#";m:?USING "##";rt(ri%):?"SEC":INPUT "",k$
310 'SIN/COS - PLOT
320 CLS:ts%=INT(TIME/300):ri%=ri%+1:r$(ri%)="MODE "+STR$(m)+" SIN/COS PLOT "
330 FOR n%=0 TO 360 STEP 1 'Higher step => increase speed / decrease quality
340 ORIGIN 320,200:PLOT SIN(n%)*200,COS(n%)*200
350 NEXT n%
360 rt(ri%)=(INT(TIME/300)-ts%)
370 IF louvre THEN LOCATE 1,1:?"SIN/COS":?"PLOT":?"MODE ";USING "#";m:?USING "##";rt(ri%):?"SEC":INPUT "",k$
380 'SIN/COS - DRAW
390 CLS:ts%=INT(TIME/300):PLOT 320,200:ri%=ri%+1:r$(ri%)="MODE "+STR$(m)+" SIN/COS DRAW "
400 FOR n%=0 TO 360 STEP 1 'Higher step => increase speed / decrease quality
410 DRAW SIN(n%)*200,COS(n%)*200
420 NEXT n%
430 DRAW 320,200
440 rt(ri%)=(INT(TIME/300)-ts%)
450 IF louvre THEN LOCATE 1,1:?"SIN/COS":?"DRAW":?"MODE ";USING "#";m:?USING "##";rt(ri%):?"SEC":INPUT "",k$
460 NEXT j
470 CLS:?"REPORT":FOR i=1 TO ri%:?r$(i);"TIME";rt(i);"SEC":NEXT i
480 END
490 'common optimization
500 LOCATE xo+xp*xt,yo+yp*yt:?c$;:LOCATE xo+xt,yo+yt:?ci$;
510 LOCATE xo-xp*xt,yo+yp*yt:?c$;:LOCATE xo-xt,yo+yt:?ci$;
520 LOCATE xo-xp*xt,yo-yp*yt:?c$;:LOCATE xo-xt,yo-yt:?ci$;
530 LOCATE xo+xp*xt,yo-yp*yt:?c$;:LOCATE xo+xt,yo-yt:?ci$;
540 RETURN
