class UdaciList
  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    type = type.downcase
    @items.push TodoItem.new(type,description, options) if type == "todo"
    @items.push EventItem.new(type,description, options) if type == "event"
    @items.push LinkItem.new(type,description, options) if type == "link"
  end

  def delete(index)
    @items.delete_at(index - 1)
  end

  def line_parser(number)
    puts "-" * number
  end

  def all
    if @title
      line_parser(@title.length)
      puts @title
      line_parser(@title.length)
    else
      line_parser("Untitled List".length)
      puts "Untitled List"
      line_parser("Untitled List".length)
    end
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
