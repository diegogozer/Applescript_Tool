--c--   capitalizeString(theText)
--d--   Capitalize a text, returning only the first letter uppercased.
--a--   theText : string -- the string to capitalize
--r--   string 
--x--   capitalizeString("this IS a Test.") --> "This is a test."
--q--   upperString, lowerString
--u--   Aurelio (http://aurelio.net/doc/as4pp.html)
on capitalizeString(theText)
	local theText, firstChar, otherChars
	try
		if theText = "" then return ""
		set firstChar to my upperString(first character of theText)
		try
			set otherChars to my lowerString(characters 2 thru -1 of theText)
		on error number -1728
			set otherChars to ""
		end try
		return firstChar & otherChars
	on error eMsg number eNum
		error "Can't capitalizeString: " & eMsg number eNum
	end try
end capitalizeString