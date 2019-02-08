require_relative('../db/sql_runner.rb')

class Tag
attr_accessor :tag_type
attr_reader :id

  def initialize(tag)
    @id = tag['id'].to_i if tag['id']
    @tag_type = tag['tag_type']
  end

  def save
    sql = "INSERT INTO tags (tag_type) VALUES ($1) RETURNING id"
    values = [@tag_type]
    result = SqlRunner.run(sql,values)
    @id = result.first['id'].to_i
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM tags"
    tags = SqlRunner.run(sql)
    return tags.map { |tag|Tag.new(tag)  }
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    tag = SqlRunner.run(sql,values).first
    return Tag.new(tag)
  end


end
