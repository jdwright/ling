
# list of file names
pname$ = "/Volumes/external1/corpora/aic/data/syls/wb/s/m110"
#fname$ = pname$ + "/random_lists/list42.txt"
#fname$ = pname$ + "/short_e_list.txt"
#fname$ = "/Users/jdwright/diss/file_list.txt"
fname$ = "/Users/jdwright/diss/discont_list.txt"

if fileReadable(fname$)
	file$ < 'fname$'
	len = length(file$)
	while len > 0
		ind = index(file$,newline$)
		l$ = left$(file$,ind-1)
		file$ = right$(file$,len-ind)
		len = length(file$)

# begin variable code, l$ contains current file name

		print 'l$''newline$'
#		f$ = pname$ + "/syls/wb/p/f113/" + l$
		f$ = pname$ + "/" + l$ + ".sph"
#		f$ = l$
		Read from file... 'f$'
		file_oid = selected("Sound")
		Edit
		pause next file?
		execute /Users/jdwright/diss/script3.praat
		select file_oid
		Remove

# end variable code

	endwhile
endif

