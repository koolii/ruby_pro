module DeepFreezable
  # freezeメソッドは返り値に引数に渡したレシーバ（引数自身）を返却
  def deep_freeze(array_of_hash)
    array_of_hash.each do |element|
      # freeze element
      element.freeze
    end

    # freeze itself
    array_of_hash.freeze
  end
end