def short_long_short(str1, str2)
  short_str = str1.length < str2.length ? str1 : str2
  long_str = short_str == str1 ? str2 : str1

  short_str + long_str + short_str
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"