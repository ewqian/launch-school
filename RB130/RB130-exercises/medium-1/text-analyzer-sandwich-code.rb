class TextAnalyzer
  def process
    File.open('sample_text.txt', 'r') do |file|
      file_str = file.read
      yield(file_str)
    end
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |str| puts "#{str.scan(/\n\n/).size + 1} paragraphs" }
analyzer.process { |str| puts "#{str.count("\n") + 1} lines" }
analyzer.process { |str| puts "#{str.split.size} words" }