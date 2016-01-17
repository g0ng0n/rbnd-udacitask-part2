module Listable
    # Listable methods go here
    def format_description(description, ljust_prop)
      "#{@description}".ljust(ljust_prop)
    end

    def format_date(params={})

      if params.include?(:start_date)
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
      value = " ⇧" if priority == "high"
      value = " ⇨" if priority == "medium"
      value = " ⇩" if priority == "low"
      value = "" if !priority
      return value
    end

    def format_name(name)
      name ? name : ""
    end
end
