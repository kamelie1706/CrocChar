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
160 ?"-------------------"
170 ?"|    CrocChar     |"
180 ?"-------------------"
190 ?
200 ?"-------------------"
210 ?"RET QUICK LIST"
220 ?"-------------------"
230 ?"1   TYPE CHAR"
240 ?"2   TYPE CHAR(NUM)"
250 ?"-------------------"
260 ?"21  PATTERN"
270 ?"22  SHOWTIME!"
280 ?"-------------------"
290 ?"31 EXPORT 32 IMPORT"
300 ?"-------------------"
310 ?"41  MODE"
320 ?"42  QUIT"
330 ?"-------------------"
340 ?"66  GNU LICENSE"
350 ?"-------------------"
360 ?
370 INPUT "YOUR CHOICE: ",sel
380 IF sel=0 THEN GOSUB 1920
390 IF sel=1 THEN GOSUB 480
400 IF sel=2 THEN c$="":GOSUB 510
410 IF sel=21 THEN c$="":GOSUB 2570
420 IF sel=22 THEN ?:INPUT "AUTO(0) or KEY(1) mode?",showmode:GOSUB 3060
430 IF sel=31 THEN c$="":GOSUB 3230
435 IF sel=32 THEN c$="":GOSUB 4230
440 IF sel=41 THEN ?:INPUT "MODE (0,1,2): ",m%:MODE m%
450 IF sel=42 THEN END
460 IF sel=66 THEN pm%=m%:m%=2:MODE m%:GOSUB 2400:m%=pm%:MODE m%
470 GOTO 150
480 'MAIN CHARACTER MENU
490 c$=""
500 ?:INPUT "CHARACTER: ",c$
510 IF c$="" THEN c$=" ":?:INPUT "CHAR NUMBER:",cnum% ELSE cnum%=ASC(c$)
520 c$=CHR$(cnum%)
530 l=1
540 FOR n=HIMEM+cnum%*8+1 TO HIMEM+cnum%*8+8
550 lt(l)=PEEK(n)
560 plt(l)=lt(l)
570 l=l+1
580 NEXT n
590 'PLAY WITH CHARACTER
600 SYMBOL cnum%,lt(1),lt(2),lt(3),lt(4),lt(5),lt(6),lt(7),lt(8)
610 CLS
620 'HEADER
630 ?"DEC ";
640 IF m%>0 THEN ?" ";
650 ?" GRAPH ";
660 IF m%>0 THEN ?" ";
670 ?" BIN";
680 ?DEC$(cnum%,"###")" ";
690 ?CHR$(1)c$
700 ?"--------------------";
710 IF m%>0 THEN ?"--" ELSE ?
720 'DISPLAY DEC
730 FOR n=1 TO 8
740 a=lt(n)
750 ?DEC$(a,"###")" ";
760 IF m%>0 THEN ?" ";
770 'DISPLAY GRAPHIC
780 FOR b=7 TO 0 STEP -1
790 IF (a AND 2^b)=2^b THEN ?gc$; ELSE ?" ";
800 NEXT b
810 '?" ";
820 IF m%>0 THEN ?" ";
830 'DISPLAY BIN
840 FOR b=7 TO 0 STEP -1
850 IF (a AND 2^b)=2^b THEN ?"1"; ELSE ?"0";
860 NEXT b
870 IF m%>0 THEN ?
880 l=l+1
890 NEXT n
900 ?
910 ?"1-UPSIDE  ";
920 ?"2-SIDE   "
930 ?"3-ROTATE  ";
940 ?"4-INVERT "
950 ?"5-BIN     ";
960 ?"6-DEC    "
970 ?"11-EMPTY  ";
980 ?"12-COPY"
990 ?"13-TABLE  ";
1000 ?"14-HELP  "
1010 ?"21-ODEC   ";
1020 ?"22-OBIN  "
1030 ?"31-MODE   ";
1040 ?"32-GRAPH "
1050 ?"41-CANCEL ";
1060 ?"RET-BACK "
1070 ?
1080 INPUT "YOUR CHOICE: ",sel
1090 IF sel=0 THEN RETURN
1100 IF sel=1 THEN GOSUB 1330
1110 IF sel=2 THEN GOSUB 1650
1120 IF sel=3 THEN GOSUB 1790
1130 IF sel=4 THEN GOSUB 1740
1140 IF sel=5 THEN GOSUB 1410
1150 IF sel=6 THEN GOSUB 1510
1160 IF sel=11 THEN FOR i=1 TO 8:lt(i)=0:NEXT i
1170 IF sel=12 THEN INPUT "CHAR(NUM): ",sc%:GOSUB 1260
1180 IF sel=13 THEN pm%=m%:m%=2:MODE m%:GOSUB 1920:m%=pm%:MODE m%
1190 IF sel=14 THEN pm%=m%:m%=2:MODE m%:GOSUB 2140:m%=pm%:MODE m%
1200 IF sel=21 THEN ft=0:GOSUB 1550
1210 IF sel=22 THEN ft=1:GOSUB 1550
1220 IF sel=31 THEN INPUT "MODE (0,1,2): ",m%:MODE m%
1230 IF sel=32 THEN INPUT "CHAR(NUM): ",gc%:gc$=CHR$(gc%)
1240 IF sel=41 THEN FOR i=1 TO 8:lt(i)=plt(i):NEXT i
1250 GOTO 590
1260 'COPY
1270 ll=1
1280 FOR n=HIMEM+sc%*8+1 TO HIMEM+sc%*8+8
1290 lt(ll)=PEEK(n)
1300 ll=ll+1
1310 NEXT n
1320 RETURN
1330 'UP/DOWN MIRROR
1340 FOR i=1 TO 8
1350 tlt(i)=lt(8-i+1)
1360 NEXT i
1370 FOR i=1 TO 8
1380 lt(i)=tlt(i)
1390 NEXT i
1400 RETURN
1410 'EDIT BINARY LINE
1420 INPUT "PICK LINE: ",pl
1430 INPUT "VALUE/BIN: ",v$
1440 nb=0
1450 FOR i=1 TO 8
1460 j$=MID$(v$,i,1)
1470 IF j$="1" OR j$="X" THEN nb=nb+2^(8-i)
1480 NEXT i
1490 lt(pl)=nb
1500 RETURN
1510 'EDIT DEC LIST(,)
1520 INPUT "DEC(8) SPLIT by ,: ",p1,p2,p3,p4,p5,p6,p7,p8
1530 lt(1)=p1:lt(2)=p2:lt(3)=p3:lt(4)=p4:lt(5)=p5:lt(6)=p6:lt(7)=p7:lt(8)=p8
1540 RETURN
1550 'OUTPUT DEC/BIN
1560 CLS
1570 FOR i=1 TO 8
1580 IF ft=0 THEN ?STR$(lt(i)); ELSE ?"&X"BIN$(lt(i));
1590 IF i<>8 THEN ?",";
1600 NEXT i
1610 ?
1620 ?
1630 INPUT "PRESS KEY!",k
1640 RETURN
1650 'SIDE MIRROR
1660 FOR n=1 TO 8
1670 t=0
1680 FOR b=0 TO 7
1690 IF (lt(n) AND 2^b)=2^b THEN t=t+2^(7-b)
1700 NEXT b
1710 lt(n)=t
1720 NEXT n
1730 RETURN
1740 'INVERT
1750 FOR n=1 TO 8
1760 lt(n)=lt(n) XOR 255
1770 NEXT n
1780 RETURN
1790 'ROTATE
1800 FOR n=1 TO 8
1810 tlt(n)=0
1820 NEXT n
1830 FOR n=1 TO 8
1840 FOR b=0 TO 7
1850 IF (lt(n) AND 2^b)=2^b THEN tlt(b+1)=tlt(b+1)+2^(n-1)
1860 NEXT b
1870 NEXT n
1880 FOR i=1 TO 8
1890 lt(i)=tlt(i)
1900 NEXT i
1910 RETURN
1920 'QUICK CHAR SEARCH
1930 S=25
1940 IF m%=0 THEN S=5:L=10
1950 IF m%=1 THEN S=12:L=10
1960 IF m%=2 THEN S=25:L=25
1970 LC=0:PRINT ""
1980 FOR I=0 TO 255 STEP S
1990 IF m%=0 AND LC=0 THEN CLS:PRINT "L/C|00|01|02|03|04";
2000 IF m%=1 AND LC=0 THEN CLS:PRINT "L/C|00|01|02|03|04|05|06|07|08|09|10|11";
2010 IF m%=2 AND LC=0 THEN CLS:PRINT "L/C|00|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24";
2020 IF m%=0 THEN PRINT "---|--|--|--|--|--"
2030 IF m%=1 THEN PRINT "---|--|--|--|--|--|--|--|--|--|--|--|--"
2040 IF m%=2 THEN PRINT "---|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--|--"
2050 PRINT "";USING "###";I;
2060 FOR J=0 TO S-1
2070 IF I+J<256 THEN PRINT "| ";CHR$(1);CHR$(I+J);
2080 NEXT J
2090 LC=LC+1
2100 IF LC>L OR I+J>255 THEN LC=0:PRINT "":?"---------":INPUT "PRESS KEY",k
2110 NEXT I
2120 PRINT ""
2130 RETURN
2140 'HELP
2150 ?"1-UPSIDE : Mirror the character upside down"
2160 ?"2-SIDE   : Mirror the character side way"
2170 ?"3-ROTATE : Simple character rotation"
2180 ?"4-INVERT : Invert the character, 0<->1"
2190 ?"5-BIN    : Edit one given character binary line."
2200 ?"           1 or X will be understood as 1 value."
2210 ?"           Any other character will be understood as 0."
2220 ?"           You need to input exactly 8 characters."
2230 ?"6-DEC    : Edit the complete character giving a series of"
2240 ?"           8 Decimal values separated by a comma (,)."
2250 ?"           Each value has to be between 0 and 255"
2260 ?"11-EMPTY : Make the character blank"
2270 ?"12-COPY  : Copy a character by giving the character source decimal value"
2280 ?"           Value has to be between 0 and 255"
2290 ?"13-TABLE : Quick current character set overview"
2300 ?"14-HELP  : Display this help"
2310 ?"21-ODEC  : Display character decimal values"
2320 ?"22-OBIN  : Display character binary values in Basic format"
2330 ?"31-MODE  : Change the display mode (0,1,2)"
2340 ?"32-GRAPH : Change the character used to paint the character."
2350 ?"           Value has to be between 0 and 255"
2360 ?"41-CANCEL: Cancel all changes done."
2370 ?"           All changes will be permanent if you return to main menu."
2380 ?"---------":INPUT "PRESS KEY",k
2390 RETURN
2400 'LICENSE
2410 ?"CROCOCHAR: Amstrad Basic character editor"
2420 ?"Copyright (C) 2023  Cyril Raphanel"
2430 ?
2440 ?"This program is free software: you can redistribute it and/or modify"
2450 ?"it under the terms of the GNU General Public License as published by"
2460 ?"the Free Software Foundation, version 3 of the License."
2470 ?
2480 ?"This program is distributed in the hope that it will be useful,"
2490 ?"but WITHOUT ANY WARRANTY; without even the implied warranty of"
2500 ?"MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the"
2510 ?"GNU General Public License for more details."
2520 ?
2530 ?"Copy of the GNU General Public License"
2540 ?"see <https://www.gnu.org/licenses/>. "
2550 ?"---------":INPUT "PRESS KEY",k
2560 RETURN
2570 'PATTERN
2580 CLS:ft=1:k$=""
2590 if m%=2 then locate 1,1 else CLS
2600 FOR i=0 TO patnb%
2610 if pat%(i,0)=32 AND pat%(i,1)=32 AND pat%(i,2)=32 AND pat%(i,2)=32 then chkm$="_" else chkm$="X"  
2620 IF i=curpat% THEN PAPER 1:PEN 0:?chkm$:PAPER 0:PEN 1 ELSE ?chkm$
2630 NEXT i
2640 FOR i=0 TO 3
2650 IF i=0 OR i=1 THEN li=1 ELSE li=9
2660 IF i=0 OR i=2 THEN co=3 ELSE co=11
2670 FOR n=HIMEM+pat%(curpat%,i)*8+1 TO HIMEM+pat%(curpat%,i)*8+8
2680 LOCATE co,li
2690 o=PEEK(n)
2700 FOR b=7 TO 0 STEP -1
2710 IF (o AND 2^b)=2^b THEN ?gc$; ELSE ?" ";
2720 NEXT b
2730 li=li+1:?
2740 NEXT n
2750 NEXT i
2760 LOCATE 1,19
2770 ?"-------------------"
2780 ?CHR$(1)CHR$(pat%(curpat%,0))CHR$(1)CHR$(pat%(curpat%,1))"|"DEC$(pat%(curpat%,0),"###")" "DEC$(pat%(curpat%,1),"###")"|"
2790 ?CHR$(1)CHR$(pat%(curpat%,2))CHR$(1)CHR$(pat%(curpat%,3))"|"DEC$(pat%(curpat%,2),"###")" "DEC$(pat%(curpat%,3),"###")"|"
2800 ?"-------------------"
2810 ?"1-NEX 2-EDI 3-PRE"
2820 ?"4-TAB 5-HEL 6-EXI"
2825 startcol%=20
2830 IF m%=2 and ft=1 THEN GOSUB 2920:ft=0
2850 k$="":i=curpat%
2855 while k$="":k$=INKEY$:wend
2860 IF k$="1" AND curpat%<patnb% THEN curpat%=curpat%+1 ELSE curpat%=0
2870 IF k$="3" AND i>0 THEN curpat%=i-1
2880 IF k$="2" THEN locate 1,23:?"                   ":?"                   ":locate 1,23:INPUT "V:",pat%(i,0),pat%(i,1),pat%(i,2),pat%(i,3):curpat%=i
2890 IF k$="4" THEN gosub 2920
2900 IF k$="6" THEN startchar%=0:RETURN
2910 GOTO 2590
2920 'TABLE LIST / MODE 2
2930 curline%=1
2937 maxlinemod2%=25
2940 curcol%=startcol%
2950 LOCATE curcol%,curline%
2960 FOR i%=startchar% TO 255
2970 curlen%=4:curstr$="#"
2980 IF i%>9 AND i%<100 THEN curlen%=5:curstr$="##"
2990 IF i%>99 THEN curlen%=6:curstr$="###"
3000 IF (curcol%+curlen%)>80 THEN curline%=curline%+1:curcol%=startcol%
3005 if curline%>maxlinemod2% then startchar%=i%:return else LOCATE curcol%,curline%
3010 ?DEC$(i%,curstr$);
3020 curcol%=curcol%+curlen%
3030 ?":"CHR$(1)CHR$(i%)"|";
3040 NEXT i%
3045 startchar%=0
3050 RETURN
3060 'SHOWTIME
3070 for j=0 to 2
3080 mode j
3090 for i=0 to 255
3100 'DISPLAY GRAPHIC
3110 CLS
3120 FOR n=HIMEM+i*8+1 TO HIMEM+i*8+8
3130 a=PEEK(n)
3140 FOR b=7 TO 0 STEP -1
3150 IF (a AND 2^b)=2^b THEN ?CHR$(1)CHR$(i); ELSE ?" ";
3160 NEXT b
3170 ?
3180 NEXT n
3190 if showmode=1 then INPUT "PRESS KEY!",k
3200 next i
3210 next j
3220 return
3230 'EXPORT
3240 INPUT "File Name: ",fin$
3245 finn$=fin$+".LIB"
3250 OPENOUT finn$
3260 for i=0 to 255 
3270 l=1
3280 FOR n=HIMEM+i*8+1 TO HIMEM+i*8+8
3290 lt(l)=PEEK(n)
3300 l=l+1
3310 NEXT n
3320 WRITE #9,i,lt(1),lt(2),lt(3),lt(4),lt(5),lt(6),lt(7),lt(8)
3330 next i
3340 CLOSEOUT
3350 return
4230 'IMPORT
4240 INPUT "File Name: ",fin$
5010 OPENIN fin$
5020 WHILE NOT EOF
5030 INPUT #9,i%,lt%(1),lt%(2),lt%(3),lt%(4),lt%(5),lt%(6),lt%(7),lt%(8)
5040 SYMBOL i%,lt%(1),lt%(2),lt%(3),lt%(4),lt%(5),lt%(6),lt%(7),lt%(8)
5050 WEND
5060 CLOSEIN
5065 return
