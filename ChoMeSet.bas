10 MODE 1:linemax%=24:line%=1:
20 SYMBOL AFTER 0:MEMORY (HIMEM-1)
30 FOR i=0 TO 255
40 IF line%>linemax% THEN INPUT "",k$:line%=1
50 ?CHR$(1)CHR$(i);" ";USING "###";i;
60 FOR n=HIMEM+i*8+1 TO HIMEM+i*8+8:PRINT ",";USING "###";PEEK(n);:NEXT n
70 line%=line%+1:?
80 NEXT i
