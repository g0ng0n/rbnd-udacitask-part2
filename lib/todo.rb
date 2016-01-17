class TodoItem < Item
  include Listable

  attr_reader :description, :due, :priority

  def initialize(type,description, options={})
    @type = type
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority] if !options[:priority].empty?
  end

  def details
    details = format_text(@type, 10) +
    format_text(@description,25) + "due: " +
    format_date(due_date: @due)

    priority = format_priority(@priority)
    details << priority if !priority.nil?
  end

  def details_array
    details = []
    details.push(format_text(@type,10))
    details.push(format_text(@description,25))
    details.push(format_date(due_date: @due))
    details.push(validate_priority(priority)) if !priority.nil?
    return details
  end

end
