
--c--   upperString(theText)
--d--   Convert a text case to upper characters.
--a--   theText : string -- the string to convert
--r--   string 
--x--   upperString("hello") --> "HELLO"
--q--   translateChars
--u--   Aurelio (http://aurelio.net/doc/as4pp.html)
on upperString(theText)
	local upper, lower, theText
	try
		return my translateChars(theText, my _lcChars_, my _ucChars_)
	on error eMsg number eNum
		error "Can't upperString: " & eMsg number eNum
	end try
end upperString