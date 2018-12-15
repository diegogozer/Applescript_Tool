--c--   capitalizeSentences(str)
--d--   Capitalize the sentences of a string (string may not contain tabs or linebreaks).
--a--   str : string -- the text to convert
--r--   string
--x--   capitalizeSentences("this is a test. and another one...") --> "This is a test. And another one..."
--q--   capitalizeString, explode, implode
--u--   ljr (http://applescript.bratis-lover.net/library/string/)
on capitalizeSentences(str)
	local str
	try
		set str to my explode(". ", str)
		set len to count str
		repeat with i from 1 to len
			set str's item i to my capitalizeString(str's item i)
		end repeat
		set str to my implode(". ", str)
		return str
	on error eMsg number eNum
		error "Can't capitalizeSentences: " & eMsg number eNum
	end try
end capitalizeSentences
