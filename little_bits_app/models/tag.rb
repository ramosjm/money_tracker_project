

class Tag
attr_accessor :tag_type
attr_reader :id

  def initialize(tag)
    @id = tag['id'].to_i if tag['id']
    @tag_type = tag['tag_type']
  end

end
