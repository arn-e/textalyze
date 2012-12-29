module TextProcessor

  def self.word_count(body)
    body.split.length
  end

  def self.word_frequency(body, container = [], result_set = [])
    words = TfIdf.new(container.push(body.split)).tf
    { :word_frequency => words[0] }
  end

  def self.rid_analysis(body, category_number = 1)
    rid_results = RiDic.category_distribution(body, 1)
    { :rid_analysis => rid_results }
  end

end
