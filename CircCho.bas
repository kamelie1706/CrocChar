10 DEG:DIM s%(90),c%(90):ri%=0:scp=3:pp=0.1
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
120 GOSUB 510
130 NEXT i
140 rt(ri%)=(INT(TIME/300)-ts%)
150 LOCATE 1,1:?"PYTHAGORE":?"MODE ";USING "#";m:?USING "##";rt(ri%):?"SEC":INPUT "",k$
160 'SIN/COS - BEST RESULT
170 CLS:ts%=INT(TIME/300):ri%=ri%+1:r$(ri%)="MODE "+STR$(m)+" SIN/COS "
180 FOR n%=0 TO 90 STEP scp 'Higher step => descrease speed / increase quality
190 s%(n%)=SIN(n%)*r%:c%(n%)=COS(n%)*r%
200 xt=s%(n%)/8:yt=c%(n%)/8:GOSUB 510
210 NEXT n%
220 rt(ri%)=(INT(TIME/300)-ts%)
230 LOCATE 1,1:?"SIN/COS":?"MODE ";USING "#";m:?USING "##";rt(ri%):?"SEC":INPUT "",k$
240 'SIN/COS - PRECALC
250 CLS:ts%=INT(TIME/300):ri%=ri%+1:r$(ri%)="MODE "+STR$(m)+" SIN/COS PRECALC "
260 FOR n%=0 TO 90 STEP scp 'Higher step => descrease speed / increase quality
270 xt=s%(n%)/8:yt=c%(n%)/8:GOSUB 510
280 NEXT n%
290 rt(ri%)=(INT(TIME/300)-ts%)
300 LOCATE 1,1:?"SIN/COS":?"PRE CALC":?"MODE ";USING "#";m:?USING "##";rt(ri%):?"SEC":INPUT "",k$
310 'SIN/COS - PLOT
320 CLS:ts%=INT(TIME/300):ri%=ri%+1:r$(ri%)="MODE "+STR$(m)+" SIN/COS PLOT "
330 FOR n%=0 TO 360 STEP 1 'Higher step => descrease speed / increase quality
340 s%(n%)=SIN(n%)*200:c%(n%)=COS(n%)*200
350 ORIGIN 320,200:PLOT s%(n%),c%(n%)
360 NEXT n%
370 rt(ri%)=(INT(TIME/300)-ts%)
380 LOCATE 1,1:?"SIN/COS":?"PLOT":?"MODE ";USING "#";m:?USING "##";rt(ri%):?"SEC":INPUT "",k$
390 'SIN/COS - DRAW
400 CLS:ts%=INT(TIME/300):PLOT 320,200:ri%=ri%+1:r$(ri%)="MODE "+STR$(m)+" SIN/COS DRAW "
410 FOR n%=0 TO 360 STEP 1 'Higher step => descrease speed / increase quality
420 s%(n%)=SIN(n%)*200:c%(n%)=COS(n%)*200
430 DRAW s%(n%),c%(n%)
440 NEXT n%
450 DRAW 320,200
460 rt(ri%)=(INT(TIME/300)-ts%)
470 LOCATE 1,1:?"SIN/COS":?"DRAW":?"MODE ";USING "#";m:?USING "##";rt(ri%):?"SEC":INPUT "",k$
480 NEXT j
490 CLS:?"REPORT":FOR i=1 TO ri%:?r$(i);"TIME";rt(i);"SEC":NEXT i
500 END
510 'common optimization
520 LOCATE xo+xp*xt,yo+yp*yt:?c$;:LOCATE xo+xt,yo+yt:?ci$;
530 LOCATE xo-xp*xt,yo+yp*yt:?c$;:LOCATE xo-xt,yo+yt:?ci$;
540 LOCATE xo-xp*xt,yo-yp*yt:?c$;:LOCATE xo-xt,yo-yt:?ci$;
550 LOCATE xo+xp*xt,yo-yp*yt:?c$;:LOCATE xo+xt,yo-yt:?ci$;
560 RETURN
