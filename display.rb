module Display
  def list(list_array)
    list_array.each do |pipe|
      yield pipe
    end
  end
end
