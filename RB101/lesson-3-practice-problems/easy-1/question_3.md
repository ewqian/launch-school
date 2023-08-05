```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!('important', 'urgent')
puts advice
```

For this problem it seems like either #sub! or #gsub! can be used since there is only one occurence of the word 'important'.