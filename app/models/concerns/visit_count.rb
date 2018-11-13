module VisitCount
    private
    def get_visit_count
        if session[:counter].nil?
            @visit_count = 0
            session[:counter] = @visit_count
        else
            session[:counter] += 1
        end
    end


    #Would like to pass this as an after_action (if successful) argument
     #in line_items_controller
    def reset_visit_count
        session[:counter] = 0
    end
end