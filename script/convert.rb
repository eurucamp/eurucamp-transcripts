require 'kramdown'
require 'pathname'

Dir["*.md"].each do |file|
  doc = Kramdown::Document.new(File.read(file))
  basename = File.basename(file, '.md')
  puts "BASENAME: #{basename}"
  File.open("#{basename}.html", "w") { |handle| handle.write(doc.to_html) }
end
