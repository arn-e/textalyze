module TextProcessor

  def self.word_count(body)
    body.split.length
  end

  def self.word_frequency(body, container = [])
    TfIdf.new(container.push(body.split)).tf
  end

end
