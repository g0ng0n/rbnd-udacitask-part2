module UdaciListErrors
  # Error classes go here
  def throw_error(error_class,params={})
    puts "-" * 10
    puts "ERROR!! - #{error_class}  "
    puts "- '#{params[:type]}' is an invalid Type..." if params[:type]
    puts "- '#{params[:index]}' exceeds List Size" if params[:index]
    puts "-" * 10
  end


  class InvalidItemType < StandardError

  end

  class IndexExceedsListSize < StandardError

  end

  class InvalidPriorityValue < StandardError
  end


end
