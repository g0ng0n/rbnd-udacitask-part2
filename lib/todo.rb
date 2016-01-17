class TodoItem
  include Listable

  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Date.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end


  def details
    format_description(@description,25) + "due: " +
    format_date(due_date: @due) +
    format_priority(@priority)
  end
end
