
sname$ = selected$("Sound")
editor Sound 'sname$'
       time = Get cursor
endeditor
select Sound 'sname$'
To Formant (burg)... 0 5 5000 0.025 50
frame = Get frame from time... time
frame = round(frame)
fileappend /Users/jdwright/diss/beg_discont.txt 'sname$' 'frame''newline$'
Remove

