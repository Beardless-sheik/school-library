module Display
  def self.list(list_array, &block)
    list_array.each(&block)
  end
end
