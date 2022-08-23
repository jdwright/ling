
To Formant (burg)... 0 5 5000 0.025 50
sname$ = selected$("Formant")
outf$ = "/Users/jdwright/diss/formants1/" + sname$ + ".f"
Write to text file... 'outf$'

fname2$ = "/Users/jdwright/diss/output2.txt"
file2$ < 'fname2$'
outf$ = "/Users/jdwright/diss/formant_frames.txt"

line$ = extractLine$(file2$,sname$)
beg = extractNumber(line$,"beg:")
end = extractNumber(line$,"end:")

beg = Get frame from time... beg
end = Get frame from time... end
beg = round(beg)
end = round(end)

fileappend 'outf$' 'sname$' 'beg' 'end''newline$'

Remove
