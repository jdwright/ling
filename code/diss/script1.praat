
To Formant (burg)... 0 5 5000 0.025 50
num = Get number of frames
print 'num''newline$'

fname2$ = "/Users/jdwright/diss/output2.txt"
file2$ < 'fname2$'
sname$ = selected$("Formant")
outf$ = "/Users/jdwright/diss/formants/" + sname$ + ".f"

line$ = extractLine$(file2$,sname$)
beg = extractNumber(line$,"beg:")
end = extractNumber(line$,"end:")

beg = Get frame from time... beg
end = Get frame from time... end
beg = round(beg)
end = round(end)

for i from beg to end
    t = Get time from frame... i
    f1 = Get value at time... 1 t Hertz Linear
    f2 = Get value at time... 2 t Hertz Linear
    f3 = Get value at time... 3 t Hertz Linear
    f1 = round(f1)
    f2 = round(f2)
    f3 = round(f3)
    #print 't:3' 'f1' 'f2' 'f3''newline$'
    fileappend 'outf$' 't:3' 'f1' 'f2' 'f3''newline$'
endfor

Remove
