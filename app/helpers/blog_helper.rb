module BlogHelper
  def color_class(i)
    if i%2 == 0
      "ocean-blue"
    elsif i%2 == 1
      "purple-grey"
    end
  end
end