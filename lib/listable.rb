module Listable
    include UdaciListErrors
    # Listable methods go here
    #this is the old format_description, I refactored by sending the text
    # I want to format, so I can use the same method but with the Type
    def format_text(text, ljust_prop)
      "#{text}".ljust(ljust_prop)
    end


    def format_date(params={})

      if params[:start_date]
        dates = params[:start_date].strftime("%D")
        if params[:end_date]
           dates << " -- " + params[:end_date].strftime("%D")
        end
        dates = "N/A" if !dates
      else
        dates = params[:due_date] ? params[:due_date].strftime("%D") : "No due date"
      end

      return dates

    end

    def format_priority(priority)

      case priority
      when "high"
        value = " ⇧".colorize(:red)
      when "medium"
        value = " ⇨".colorize(:light_yellow)
      when "low"
        value = " ⇩".colorize(:light_magenta)
      else
        raise "#{UdaciListErrors::InvalidPriorityValue} '#{priority}' is an Invalid Priority"
      end

      return value
    end

    def format_name(name)
      name ? name : ""
    end
end
