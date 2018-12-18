module CurrentCount
  def count
    @count = if session[:store_visit_count]
               session[:store_visit_count] += 1
             else
               session[:store_visit_count] = 0
             end
  end

  def initialize_counter
    @count = 0
  end
end
