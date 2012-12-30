module TextProcessor

  def self.word_count(body)
    body.split.length
  end

  def self.word_frequency(body, container = [], result_set = [])
    sorted = {}
    words = TfIdf.new(container.push(body.split)).tf
    words[0].sort_by {|key, value| value}.reverse[0...17].each {|elem| sorted[elem[0]] = elem[1]}
    { :word_frequency => sorted }
  end

  def self.rid_analysis(body, category_number = 1)
    rid_results = RiDic.category_distribution(body, 1)
    { :rid_analysis => rid_results }
  end

end
