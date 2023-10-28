10 'INIT
20 patnb%=17
30 patcharnb%=3
40 DIM pat%(patnb%,patcharnb%)
50 FOR i=0 TO patnb%
60 FOR j=0 TO patcharnb%
70 pat%(i,j)=32
80 NEXT j
90 NEXT i
100 curpat%=0
110 gc$="X"
120 m%=2:MODE m%
130 SYMBOL AFTER 0
140 'MAIN MENU
150 CLS
160 startchar%=0
170 ?"-------------------"
180 ?"|    CrocChar     |"
190 ?"-------------------"
200 ?
210 ?"-------------------"
220 ?"RET QUICK LIST"
230 ?"-------------------"
240 ?"1   TYPE CHAR"
250 ?"2   TYPE CHAR(NUM)"
260 ?"-------------------"
270 ?"21  PATTERN"
280 ?"22  SHOWTIME!"
290 ?"-------------------"
300 ?"31 EXPORT 32 IMPORT"
310 ?"-------------------"
320 ?"41  MODE"
330 ?"42  QUIT"
340 ?"-------------------"
350 ?"66  GNU LICENSE"
360 ?"-------------------"
370 ?
380 INPUT "YOUR CHOICE: ",sel
390 IF sel=0 THEN GOSUB 1960
400 IF sel=1 THEN GOSUB 500
410 IF sel=2 THEN c$="":GOSUB 530
420 IF sel=21 THEN c$="":GOSUB 2610
430 IF sel=22 THEN ?:INPUT "AUTO(0) or KEY(1) mode?",showmode:GOSUB 3140
440 IF sel=31 THEN c$="":GOSUB 3310
450 IF sel=32 THEN c$="":GOSUB 3450
460 IF sel=41 THEN ?:INPUT "MODE (0,1,2): ",m%:MODE m%
470 IF sel=42 THEN END
480 IF sel=66 THEN pm%=m%:m%=2:MODE m%:GOSUB 2440:m%=pm%:MODE m%
490 GOTO 150
500 'MAIN CHARACTER MENU
510 c$=""
520 ?:INPUT "CHARACTER: ",c$
530 IF c$="" THEN c$=" ":?:INPUT "CHAR NUMBER:",cnum% ELSE cnum%=ASC(c$)
540 c$=CHR$(cnum%)
550 l=1
560 FOR n=HIMEM+cnum%*8+1 TO HIMEM+cnum%*8+8
570 lt(l)=PEEK(n)
580 plt(l)=lt(l)
590 l=l+1
600 NEXT n
610 'PLAY WITH CHARACTER
620 SYMBOL cnum%,lt(1),lt(2),lt(3),lt(4),lt(5),lt(6),lt(7),lt(8)
630 CLS:ft=1:startcol%=24
640 IF m%=2 and ft=1 THEN GOSUB 2970:ft=0 
650 'HEADER
660 locate 1,1
670 ?"DEC ";
680 IF m%>0 THEN ?" ";
690 ?" GRAPH ";
700 IF m%>0 THEN ?" ";
710 ?" BIN";
720 ?DEC$(cnum%,"###")" ";
730 ?CHR$(1)c$
740 ?"--------------------";
750 IF m%>0 THEN ?"--" ELSE ?
760 'DISPLAY DEC
770 FOR n=1 TO 8
780 a=lt(n)
790 ?DEC$(a,"###")" ";
800 IF m%>0 THEN ?" ";
810 'DISPLAY GRAPHIC
820 FOR b=7 TO 0 STEP -1
830 IF (a AND 2^b)=2^b THEN ?gc$; ELSE ?" ";
840 NEXT b
850 '?" ";
860 IF m%>0 THEN ?" ";
870 'DISPLAY BIN
880 FOR b=7 TO 0 STEP -1
890 IF (a AND 2^b)=2^b THEN ?"1"; ELSE ?"0";
900 NEXT b
910 IF m%>0 THEN ?
920 l=l+1
930 NEXT n
940 ?
950 ?"1-UPSIDE  ";
960 ?"2-SIDE   "
970 ?"3-ROTATE  ";
980 ?"4-INVERT "
990 ?"5-BIN     ";
1000 ?"6-DEC    "
1010 ?"11-EMPTY  ";
1020 ?"12-COPY"
1030 ?"13-TABLE  ";
1040 ?"14-HELP  "
1050 ?"21-ODEC   ";
1060 ?"22-OBIN  "
1070 ?"31-MODE   ";
1080 ?"32-GRAPH "
1090 ?"41-CANCEL ";
1100 ?"RET-BACK "
1110 ?
1120 INPUT "YOUR CHOICE: ",sel
1130 IF sel=0 THEN RETURN
1140 IF sel=1 THEN GOSUB 1370
1150 IF sel=2 THEN GOSUB 1690
1160 IF sel=3 THEN GOSUB 1830
1170 IF sel=4 THEN GOSUB 1780
1180 IF sel=5 THEN GOSUB 1450
1190 IF sel=6 THEN GOSUB 1550
1200 IF sel=11 THEN FOR i=1 TO 8:lt(i)=0:NEXT i
1210 IF sel=12 THEN INPUT "CHAR(NUM): ",sc%:GOSUB 1300
1220 IF sel=13 THEN pm%=m%:m%=2:MODE m%:GOSUB 1960:m%=pm%:MODE m%
1230 IF sel=14 THEN pm%=m%:m%=2:MODE m%:GOSUB 2180:m%=pm%:MODE m%
1240 IF sel=21 THEN ft=0:GOSUB 1590
1250 IF sel=22 THEN ft=1:GOSUB 1590
1260 IF sel=31 THEN INPUT "MODE (0,1,2): ",m%:MODE m%
1270 IF sel=32 THEN INPUT "CHAR(NUM): ",gc%:gc$=CHR$(gc%)
1280 IF sel=41 THEN FOR i=1 TO 8:lt(i)=plt(i):NEXT i
1290 GOTO 610
1300 'COPY
1310 ll=1
1320 FOR n=HIMEM+sc%*8+1 TO HIMEM+sc%*8+8
1330 lt(ll)=PEEK(n)
1340 ll=ll+1
1350 NEXT n
1360 RETURN
1370 'UP/DOWN MIRROR
1380 FOR i=1 TO 8
1390 tlt(i)=lt(8-i+1)
1400 NEXT i
1410 FOR i=1 TO 8
1420 lt(i)=tlt(i)
1430 NEXT i
1440 RETURN
1450 'EDIT BINARY LINE
1460 INPUT "PICK LINE: ",pl
1470 INPUT "VALUE/BIN: ",v$
1480 nb=0
1490 FOR i=1 TO 8
1500 j$=MID$(v$,i,1)
1510 IF j$="1" OR j$="X" THEN nb=nb+2^(8-i)
1520 NEXT i
1530 lt(pl)=nb
1540 RETURN
1550 'EDIT DEC LIST(,)
1560 INPUT "DEC(8) SPLIT by ,: ",p1,p2,p3,p4,p5,p6,p7,p8
1570 lt(1)=p1:lt(2)=p2:lt(3)=p3:lt(4)=p4:lt(5)=p5:lt(6)=p6:lt(7)=p7:lt(8)=p8
1580 RETURN
1590 'OUTPUT DEC/BIN
1600 CLS
1610 FOR i=1 TO 8
1620 IF ft=0 THEN ?STR$(lt(i)); ELSE ?"&X"BIN$(lt(i));
1630 IF i<>8 THEN ?",";
1640 NEXT i
1650 ?
1660 ?
1670 INPUT "PRESS KEY!",k
1680 RETURN
1690 'SIDE MIRROR
1700 FOR n=1 TO 8
1710 t=0
1720 FOR b=0 TO 7
1730 IF (lt(n) AND 2^b)=2^b THEN t=t+2^(7-b)
1740 NEXT b
1750 lt(n)=t
1760 NEXT n
1770 RETURN
1780 'INVERT
1790 FOR n=1 TO 8
1800 lt(n)=lt(n) XOR 255
1810 NEXT n
1820 RETURN
1830 'ROTATE
1840 FOR n=1 TO 8
1850 tlt(n)=0
1860 NEXT n
1870 FOR n=1 TO 8
1880 FOR b=0 TO 7
1890 IF (lt(n) AND 2^b)=2^b THEN tlt(b+1)=tlt(b+1)+2^(n-1)
1900 NEXT b
1910 NEXT n
1920 FOR i=1 TO 8
1930 lt(i)=tlt(i)
1940 NEXT i
1950 RETURN
1960 'QUICK CHAR SEARCH
1970 S=25
1980 IF m%=0 THEN S=5:L=10
1990 IF m%=1 THEN S=12:L=10
2000 IF m%=2 THEN S=25:L=25
2010 LC=0:PRINT ""
2020 FOR I=0 TO 255 STEP S
2030 IF m%=0 AND LC=0 THEN CLS:PRINT "L/C|00|01|02|03|04";
2040 IF m%=1 AND LC=0 THEN CLS:PRINT "L/C|00|01|02|03|04|05|06|07|08|09|10|11";
2050 IF m%=2 AND LC=0 THEN CLS:PRINT "L/C|00|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24";
2060 IF m%=0 THEN PRINT "---|--|--|--|--|--"
2070 IF m%=1 THEN PRINT "---|--|--|--|--|--|--|--|--|--|--|--|--"
2080 IF m%=2 THEN PRINT "---|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--"
2090 PRINT "";USING "###";I;
2100 FOR J=0 TO S-1
2110 IF I+J<256 THEN PRINT "| ";CHR$(1);CHR$(I+J);
2120 NEXT J
2130 LC=LC+1
2140 IF LC>L OR I+J>255 THEN LC=0:PRINT "":?"---------":INPUT "PRESS KEY",k
2150 NEXT I
2160 PRINT ""
2170 RETURN
2180 'HELP
2190 ?"1-UPSIDE : Mirror the character upside down"
2200 ?"2-SIDE   : Mirror the character side way"
2210 ?"3-ROTATE : Simple character rotation"
2220 ?"4-INVERT : Invert the character, 0<->1"
2230 ?"5-BIN    : Edit one given character binary line."
2240 ?"           1 or X will be understood as 1 value."
2250 ?"           Any other character will be understood as 0."
2260 ?"           You need to input exactly 8 characters."
2270 ?"6-DEC    : Edit the complete character giving a series of"
2280 ?"           8 Decimal values separated by a comma (,)."
2290 ?"           Each value has to be between 0 and 255"
2300 ?"11-EMPTY : Make the character blank"
2310 ?"12-COPY  : Copy a character by giving the character source decimal value"
2320 ?"           Value has to be between 0 and 255"
2330 ?"13-TABLE : Quick current character set overview"
2340 ?"14-HELP  : Display this help"
2350 ?"21-ODEC  : Display character decimal values"
2360 ?"22-OBIN  : Display character binary values in Basic format"
2370 ?"31-MODE  : Change the display mode (0,1,2)"
2380 ?"32-GRAPH : Change the character used to paint the character."
2390 ?"           Value has to be between 0 and 255"
2400 ?"41-CANCEL: Cancel all changes done."
2410 ?"           All changes will be permanent if you return to main menu."
2420 ?"---------":INPUT "PRESS KEY",k
2430 RETURN
2440 'LICENSE
2450 ?"CROCOCHAR: Amstrad Basic character editor"
2460 ?"Copyright (C) 2023  Cyril Raphanel"
2470 ?
2480 ?"This program is free software: you can redistribute it and/or modify"
2490 ?"it under the terms of the GNU General Public License as published by"
2500 ?"the Free Software Foundation, version 3 of the License."
2510 ?
2520 ?"This program is distributed in the hope that it will be useful,"
2530 ?"but WITHOUT ANY WARRANTY; without even the implied warranty of"
2540 ?"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
2550 ?"GNU General Public License for more details."
2560 ?
2570 ?"Copy of the GNU General Public License"
2580 ?"see <https://www.gnu.org/licenses/>. "
2590 ?"---------":INPUT "PRESS KEY",k
2600 RETURN
2610 'PATTERN
2620 CLS:ft=1:k$=""
2630 if m%=2 then locate 1,1 else CLS
2640 FOR i=0 TO patnb%
2650 if pat%(i,0)=32 AND pat%(i,1)=32 AND pat%(i,2)=32 AND pat%(i,2)=32 then chkm$="_" else chkm$="X"  
2660 IF i=curpat% THEN PAPER 1:PEN 0:?chkm$:PAPER 0:PEN 1 ELSE ?chkm$
2670 NEXT i
2680 FOR i=0 TO 3
2690 IF i=0 OR i=1 THEN li=1 ELSE li=9
2700 IF i=0 OR i=2 THEN co=3 ELSE co=11
2710 FOR n=HIMEM+pat%(curpat%,i)*8+1 TO HIMEM+pat%(curpat%,i)*8+8
2720 LOCATE co,li
2730 o=PEEK(n)
2740 FOR b=7 TO 0 STEP -1
2750 IF (o AND 2^b)=2^b THEN ?gc$; ELSE ?" ";
2760 NEXT b
2770 li=li+1:?
2780 NEXT n
2790 NEXT i
2800 LOCATE 1,19
2810 ?"-------------------"
2820 ?CHR$(1)CHR$(pat%(curpat%,0))CHR$(1)CHR$(pat%(curpat%,1))"|"DEC$(pat%(curpat%,0),"###")" "DEC$(pat%(curpat%,1),"###")"|"
2830 ?CHR$(1)CHR$(pat%(curpat%,2))CHR$(1)CHR$(pat%(curpat%,3))"|"DEC$(pat%(curpat%,2),"###")" "DEC$(pat%(curpat%,3),"###")"|"
2840 ?"-------------------"
2850 ?"1-NEX 2-EDI 3-PRE"
2860 ?"4-TAB 5-HEL 6-EXI"
2870 startcol%=20
2880 IF m%=2 and ft=1 THEN GOSUB 2970:ft=0
2890 k$="":i=curpat%
2900 while k$="":k$=INKEY$:wend
2910 IF k$="1" AND curpat%<patnb% THEN curpat%=curpat%+1 ELSE curpat%=0
2920 IF k$="3" AND i>0 THEN curpat%=i-1
2930 IF k$="2" THEN locate 1,23:?"                   ":?"                   ":locate 1,23:INPUT "V:",pat%(i,0),pat%(i,1),pat%(i,2),pat%(i,3):curpat%=i
2940 IF k$="4" THEN ft=1:pm%=m%:m%=2:MODE m%:GOSUB 1960:m%=pm%:MODE m%
2950 IF k$="6" THEN RETURN
2960 GOTO 2630
2970 'TABLE LIST / MODE 2
2980 curline%=1
2990 maxlinemod2%=25
3000 curcol%=startcol%
3010 LOCATE curcol%,curline%
3020 FOR i%=startchar% TO 255
3030 curlen%=4:curstr$="#"
3040 IF i%>9 AND i%<100 THEN curlen%=5:curstr$="##"
3050 IF i%>99 THEN curlen%=6:curstr$="###"
3060 IF (curcol%+curlen%)>80 THEN curline%=curline%+1:curcol%=startcol%
3070 if curline%>maxlinemod2% then startchar%=i%:return else LOCATE curcol%,curline%
3080 ?DEC$(i%,curstr$);
3090 curcol%=curcol%+curlen%
3100 ?":"CHR$(1)CHR$(i%)"|";
3110 NEXT i%
3120 startchar%=0
3130 RETURN
3140 'SHOWTIME
3150 for j=0 to 2
3160 mode j
3170 for i=0 to 255
3180 'DISPLAY GRAPHIC
3190 CLS
3200 FOR n=HIMEM+i*8+1 TO HIMEM+i*8+8
3210 a=PEEK(n)
3220 FOR b=7 TO 0 STEP -1
3230 IF (a AND 2^b)=2^b THEN ?CHR$(1)CHR$(i); ELSE ?" ";
3240 NEXT b
3250 ?
3260 NEXT n
3270 if showmode=1 then INPUT "PRESS KEY!",k
3280 next i
3290 next j
3300 return
3310 'EXPORT
3320 INPUT "File Name: ",fin$
3330 finn$=fin$+".LIB"
3340 OPENOUT finn$
3350 for i=0 to 255 
3360 l=1
3370 FOR n=HIMEM+i*8+1 TO HIMEM+i*8+8
3380 lt(l)=PEEK(n)
3390 l=l+1
3400 NEXT n
3410 WRITE #9,i,lt(1),lt(2),lt(3),lt(4),lt(5),lt(6),lt(7),lt(8)
3420 next i
3430 CLOSEOUT
3440 return
3450 'IMPORT
3460 INPUT "File Name: ",fin$
3470 OPENIN fin$
3480 WHILE NOT EOF
3490 INPUT #9,i%,lt%(1),lt%(2),lt%(3),lt%(4),lt%(5),lt%(6),lt%(7),lt%(8)
3500 SYMBOL i%,lt%(1),lt%(2),lt%(3),lt%(4),lt%(5),lt%(6),lt%(7),lt%(8)
3510 WEND
3520 CLOSEIN
3530 return
