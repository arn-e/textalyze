module TextProcessor

  def self.word_count(body)
    body.split.length
  end

  def self.word_frequency(body, container = [], result_set = [])
    words = TfIdf.new(container.push(body.split)).tf
    { :word_frequency => words }
  end

end
