--c--   capitalizeWordsWithExceptions(theText, exceptionList)
--d--   Capitalize a text, returning the first letter of every word (except exceptionlist) uppercased.
--a--   str : string -- the string to capitalize
--a--   exceptionList : list -- list of words that should not be capitalized
--r--   string 
--x--   capitalizeWordsWithExceptions("there hE found tHE cAt.", {"the"}) --> ""There He Found the Cat."
--q--   lowerString
--u--   ljr (http://applescript.bratis-lover.net/library/string/),
--u--   based on capitalizeWords by HAS (http://applemods.sourceforge.net/mods/Data/String.php) 
on capitalizeWordsWithExceptions(str, exceptionList)
	-- modified by ljr to handle non-letter characters at beginning of a word
	local oldTIDs, _lcChars, _ucChars, str, lst, len, max, idx, x
	set oldTIDs to AppleScript's text item delimiters
	--set noCapList to {"the"}
	try
		set _lcChars to my _lcChars_
		set _ucChars to my _ucChars_
		set max to count _ucChars
		set str to my lowerString(str)
		set lst to {}
		set len to (str's text 1 thru (word 1)'s length) - (str's word 1's length)
		if len is greater than 0 then
			set lst's end to str's text 1 thru len
			set str to str's text (len + 1) thru -1
		end if
		set x to 0 -- ljr: flag for first word (always capitalize)
		repeat (count str's words) - 1 times
			set len to (str's text 1 thru (word 2)'s length) - (str's word 2's length)
			set AppleScript's text item delimiters to (get str's character 1)
			set idx to ((_lcChars's text item 1's length) + 1)
			if idx ² max and str's word 1 is not in exceptionList then
				set lst's end to (_ucChars's character (idx)) & str's text 2 thru len
			else if idx ² max and str's word 1 is in exceptionList and x = 0 then
				set lst's end to (_ucChars's character (idx)) & str's text 2 thru len
			else
				set lst's end to str's text 1 thru len
			end if
			set str to str's text (len + 1) thru -1
			set x to 1
		end repeat
		set AppleScript's text item delimiters to (get str's character 1)
		set idx to ((_lcChars's text item 1's length) + 1)
		if idx ² max and str's word 1 is not in exceptionList then
			set lst's end to (_ucChars's character ((_lcChars's text item 1's length) + 1))
		else
			set lst's end to (get str's character 1)
		end if
		if str's length > 1 then set lst's end to str's text 2 thru -1
		set AppleScript's text item delimiters to ""
		set str to lst as string
		set AppleScript's text item delimiters to oldTIDs
		return str
	on error eMsg number eNum
		set AppleScript's text item delimiters to oldTIDs
		error "Can't capitalizeWordsWithExceptions: " & eMsg number eNum
	end try
end capitalizeWordsWithExceptions