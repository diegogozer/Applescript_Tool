--c--   translateChars(theText, fromChars, toChars)
--d--   Translate characters of a text.
--a--   theText : string -- the string to translate in
--a--   fromChars : string -- string of characters to translate
--a--   toChars : string -- string of characters to translate to
--r--   string 
--x--   translateChars("abc", "b", "X") --> "aXc"
--u--   Aurelio (http://aurelio.net/doc/as4pp.html)
on translateChars(theText, fromChars, toChars)
	local Newtext, fromChars, toChars, char, newChar, theText
	try
		set Newtext to ""
		if (count fromChars) ­ (count toChars) then
			error "translateChars: From/To strings have different lenght"
		end if
		repeat with char in theText
			set newChar to char
			set x to offset of char in fromChars
			if x is not 0 then set newChar to character x of toChars
			set Newtext to Newtext & newChar
		end repeat
		return Newtext
	on error eMsg number eNum
		error "Can't translateChars: " & eMsg number eNum
	end try
end translateChars