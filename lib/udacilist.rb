class UdaciList
  include UdaciListErrors

  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title]
    @items = []
  end
  def add(type, description, options={})
    begin
      type = type.downcase
      case type
      when "todo"
        @items.push TodoItem.new(type,description, options)
      when "event"
        @items.push EventItem.new(type,description, options)
      when "link"
        @items.push LinkItem.new(type,description, options)
      else
        raise UdaciListErrors::InvalidItemType
      end
   rescue Exception => e
     throw_error(e,type: type)
   end
  end

  def delete(index)
    begin
      if @items.length > index
        @items.delete_at(index - 1)
      else
        raise UdaciListErrors::IndexExceedsListSize
      end
    rescue Exception => e
        throw_error(e, index: index)
    end
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
      begin
        puts "#{position + 1}) #{item.details}"
      rescue Exception => e
        throw_error(e)
      end
    end
  end

  def filter(filter)
    puts "Filter Feature"
    result =[]
    result = @items.find_all { |item| result.push(item) if item.type.eql?(filter) }
    if !result.empty?
      result.each_with_index do |item, position|
          puts "#{position + 1}) #{item.details}"
      end
    else
      puts "There are no #{filter} Items"
    end
  end
end
