# notes : 
# improve legibility in word frequency method

module TextProcessor

  def self.word_count(body)
    body.split.length
  end

  def self.word_frequency(body, container = [], result_set = [])
    sorted = {}
    words = TfIdf.new(container.push(sanitized(body.downcase.split))).tf
    words[0].sort_by {|key, value| value}.reverse[0...17].each {|elem| sorted[elem[0]] = elem[1]}
    { :word_frequency => sorted }
  end

  def self.rid_analysis(body, category_number = 1)
    rid_results = RiDic.category_distribution(body, 1)
    { :rid_analysis => rid_results }
  end

  private

  def self.sanitized(string)
    words = {"about" => 1,"after" => 1,"all" => 1,"also" => 1,"an" => 1,"and" => 1,"another" => 1,"any" => 1,"are" => 1,"as" => 1,"at" => 1,"be" => 1,"because" => 1,"been" => 1,"before" => 1,
      "being" => 1,"between" => 1,"both" => 1,"but" => 1,"by" => 1,"came" => 1,"can" => 1,"come" => 1,"could" => 1,"did" => 1,"do" => 1,"each" => 1,"for" => 1,"from" => 1,"get" => 1,
      "got" => 1,"has" => 1,"had" => 1,"he" => 1,"have" => 1,"her" => 1,"here" => 1,"him" => 1,"himself" => 1,"his" => 1,"how" => 1,"if" => 1,"in" => 1,"into" => 1,"is" => 1,"it" => 1,"like" =>1,
      "make" => 1,"many" => 1,"me" => 1,"might" => 1,"more" => 1,"most" => 1,"much" => 1,"must" => 1,"my" => 1,"never" => 1,"now" => 1,"of" => 1,"on" => 1,"only" => 1,"or" => 1,"other" => 1,
      "our" => 1,"out" => 1,"over" => 1,"said" => 1,"same" => 1,"see" => 1,"should" => 1,"since" => 1,"some" => 1,"still" => 1,"such" => 1,"take" => 1,"than" => 1,"that" => 1,
      "the" => 1,"their" => 1,"them" => 1,"then" => 1,"there" => 1,"these" => 1,"they" => 1,"this" => 1,"those" => 1,"through" => 1,"to" => 1,"too" => 1,"under" => 1,"up" => 1,
      "very" => 1,"was" => 1,"way" => 1,"we" => 1,"well" => 1,"were" => 1,"what" => 1,"where" => 1,"which" => 1,"while" => 1,"who" => 1,"with" => 1,"would" => 1,"you" => 1,"your" => 1,"a" => 1,
      "b" => 1,"c" => 1,"d" => 1,"e" => 1,"f" => 1,"g" => 1,"h" => 1,"i" => 1,"j" => 1,"k" => 1,"l" => 1,"m" => 1,"n" => 1,"o" => 1,"p" => 1,"q" => 1,"r" => 1,"s" => 1,"t" => 1,"u" => 1,"v" => 1,"w" => 1,"x" => 1,"y" => 1,"z" => 1,"$" => 1,
      "1" => 1,"2" => 1,"3" => 1,"4" => 1,"5" => 1,"6" => 1,"7" => 1,"8" => 1,"9" => 1,"0" => 1,"_" => 1}
    string = string.delete_if {|i| words[i] == 1}  
    string = string.delete_if {|i| i.gsub!(/\W*/,"") == ""}
    string = string.delete_if {|i| i.gsub!(/\d*/,"") == ""}
    string
  end


end
