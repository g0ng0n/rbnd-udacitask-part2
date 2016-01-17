class TodoItem < Item
  include Listable

  attr_reader :description, :due, :priority

  def initialize(type,description, options={})
    @type = type
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  def details
    format_text(@type, 10)+
    format_text(@description,25) + "due: " +
    format_date(due_date: @due) +
    format_priority(@priority)
  end

end
