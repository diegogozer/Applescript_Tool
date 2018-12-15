--c--   lowerString(theText)
--d--   Convert a text case to lower characters.
--a--   theText : string -- the string to convert
--r--   string 
--x--   lowerString("HELLO") --> "hello"
--q--   translateChars
--u--   Aurelio (http://aurelio.net/doc/as4pp.html)
on lowerString(theText)
	local upper, lower, theText
	try
		return my translateChars(theText, my _ucChars_, my _lcChars_)
	on error eMsg number eNum
		error "Can't lowerString: " & eMsg number eNum
	end try
end lowerString