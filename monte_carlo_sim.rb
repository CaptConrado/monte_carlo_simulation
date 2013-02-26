

@options = ['dead','hurt','alive']
@results = []


def events 
	x = @options.sample
	@results.push(x)
end


86457.times {events}

puts @results

dead_count = @results.select {|v| v =~ /dead/}   #=> ["a", "e"]
hurt_count = @results.select {|v| v =~ /hurt/}   #=> ["a", "e"]
alive_count = @results.select {|v| v =~ /alive/}   #=> ["a", "e"]

puts "dead #{dead_count.size}"
puts "hurt #{hurt_count.size}"
puts "alive #{alive_count.size}"

puts total = dead_count.size + hurt_count.size + alive_count.size
puts dead_per = dead_count.size/total.to_f
puts hurt_per = hurt_count.size/total.to_f
puts alive_per = alive_count.size/total.to_f

target = File.open("results.html", 'w')

puts "I am going to write these to the file."

header = "<html><head></head><body>"
ul = "<ul>";close_ul = "</ul>";li = "<li>";close_li = "</li>";h1 = "<h1>";close_h1 = "</h1>";close_body = "</body>"
title = "We ran the simulation and have determined that \n out of #{total} tests, \n\n"
res1 = "\t #{dead_count.size} People didn't make it. #{dead_per}\n\n"
res2 = "\t #{hurt_count.size} People only got injured. #{hurt_per}\n\n"
res3 = "\t #{alive_count.size} People are going to live. #{alive_per}\n\n"

text = header + h1 +title+close_h1 +ul + li + res1 +close_li+li + res2 +close_li+li + res3 + close_li+ close_ul +close_body

puts text

target.write (text)
puts "And finally we close it."
target.close()