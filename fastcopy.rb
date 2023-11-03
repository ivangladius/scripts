
lines = `ls -all`


sum = 0
for line in `ls -all`.split("\n") do
  columns = line.split(" ")
  if columns.length() >= 4 then
    size = columns[4].to_i
    sum += size
    puts size
  end
end
puts "size: #{sum}"
