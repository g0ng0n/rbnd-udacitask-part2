module Listable
  # Listable methods go here
  def format_description(description, ljust_prop)
    "#{@description}".ljust(ljust_prop)
  end

end
