module TextProcessor

  def self.word_count(body)
    body.split.length
  end

  def self.word_frequency(body, container = [], result_set = [])
    words = TfIdf.new(container.push(body.split)).tf
    { :word_frequency => words }
    # words.first.each {|i| result_set << i[0]}
    # result_set[0..5]
  end

end
