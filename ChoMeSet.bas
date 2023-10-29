10 ' CONFIGURATION
20 charp%=1 '1=print the actual character
30 MODE 2 'Display mode
40 linemax%=24 'Record number per screen/step
50 ' START 
60 line%=1:
70 FOR i=0 TO 255
80 IF line%>linemax% THEN INPUT "",k$:line%=1
90 IF charp%=1 THEN PRINT CHR$(1)CHR$(i);
100 PRINT " ";USING "###";i;
110 FOR n=HIMEM+i*8+1 TO HIMEM+i*8+8:PRINT ",";USING "###";PEEK(n);:NEXT n
120 line%=line%+1
130 PRINT
140 NEXT i
