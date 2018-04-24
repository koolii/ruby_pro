module DeepFreezable
  # freezeメソッドは返り値に引数に渡したレシーバ（引数自身）を返却
  def deep_freeze(array_of_hash)
    case array_of_hash
    when Array
      array_of_hash.each do |element|
        # freeze element
        element.freeze
      end
    when Hash
      array_of_hash.each do |key, value|
        # freeze key, value
        key.freeze
        value.freeze
      end
    end

    # freeze itself
    array_of_hash.freeze
  end
end