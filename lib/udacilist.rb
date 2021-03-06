class UdaciList
  include Loggeable, UdaciListErrors, Printable


  attr_reader :title, :items

  def initialize(options={})
    @title = options[:title] ? options[:title] : "Untitled List"
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
     logger.error(retrieve_error(e,type: type))
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
        logger.error(retrieve_error(e, index: index))
    end
  end


  def all
    print_msg(@title)
    @items.each_with_index do |item, position|
      begin
        puts "#{position + 1}) #{item.details}"
      rescue Exception => e
        logger.error(retrieve_error(e))
      end
    end
  end

  def print_filter(filter)
    print_msg("Filter Feature")
    result = type_filter(filter)
    begin
      if !result.empty?
        result.each_with_index do |item, position|
            puts "#{position + 1}) #{item.details}"
        end
      else
        raise "#{UdaciListErrors::NoItemsInList} There are no #{filter} Items"
      end
    rescue Exception => e
      logger.error(retrieve_error(e))
    end
  end

  def create_pdf
    Pdf_generator(@title,type_filter("todo").concat(type_filter("event")))
  end

  private
    def type_filter(filter)
      res = []
      @items.find_all { |item| res.push(item) if item.type.eql?(filter) }
      return res
    end


    def line_parser(number)
      puts "-" * number
    end

    def print_msg(msg)
      line_parser(msg.length)
      puts msg
      line_parser(msg.length)
    end

end
