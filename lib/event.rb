class EventItem < Item
  include Listable
  attr_reader :description, :start_date, :end_date

  def initialize(type,description, options={})
    @type = type

    @description = description
    @start_date = Chronic.parse(options[:start_date]) if options[:start_date]
    @end_date = Chronic.parse(options[:end_date]) if options[:end_date]
  end

  def details
    format_text(@type,10) + format_text(@description,25) + "event dates: " + format_date(start_date: @start_date, end_date: @end_date)
  end

end
