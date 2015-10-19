require 'csv'

name = "2015.csv"

headers = []
CSV.foreach(name) do |row|
	headers.push(row[0]) unless headers.include?(row[0])
end

content = []
content_int = []
count = 1
CSV.foreach(name) do |row|
	content_int.push(row[1]) unless content_int.include?(row[1])
	if (count % headers.size) == 0
		content << content_int
		content_int = []
	end
	count += 1
end

CSV.open("new_#{name}", "wb") do |csv|
	csv << headers
	content.each do |single|
		csv << single
	end
end