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
end