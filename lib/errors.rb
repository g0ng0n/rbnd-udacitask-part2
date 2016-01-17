module UdaciListErrors
  # Error classes go here
  def retrieve_error(error_class,params={})
    error_msg= "ERROR!! - #{error_class}  "
    msg =""
    if params[:type]
      msg="- '#{params[:type]}' is an invalid Type..."
    end
    if params[:index]
      msg +=  "- '#{params[:index]}' exceeds List Size"
    end

    msg += "-" * 10
    return error_msg + msg

  end

  class InvalidItemType < StandardError

  end

  class IndexExceedsListSize < StandardError

  end

  class InvalidPriorityValue < StandardError
  end

  class NoItemsInList < StandardError
  end

end
