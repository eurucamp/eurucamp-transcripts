require 'kramdown'
require 'pathname'

EXCLUDE = ['README.md']

Dir["*.md"].each do |file|
  if EXCLUDE.include?(file)
    next
  end
  doc = Kramdown::Document.new(File.read(file))
  basename = File.basename(file, '.md')
  puts "BASENAME: #{basename}"
  File.open("#{basename}.html", "w") { |handle| handle.write(doc.to_html) }
end
