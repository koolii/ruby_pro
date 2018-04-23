module Loggable
  private

  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  # クラスにモジュールをincludeして機能を追加することを mixin と言う
  include Loggable

  def title
    log 'title is called.'
    'A great movie'
  end
end

class User
  include Loggable

  def name
    log 'name is called.'
    'Alice'
  end
end

product = Product.new
p product.title

user = User.new
p user.name

# Loggableモジュールがprivateアクセスのみを許可しているので、クラス内部からメソッドを呼び出すことはできない
# user.log 'public call'


class Product2
  # moduleのメソッドをそのままクラス・メソッドとして定義する
  extend Loggable

  def self.create_products(names)
    log "create_products is called (names: #{names})"
  end
end

Product2.create_products(['apple', 'banana', 'strawberry'])

# Loggableのlogがprivateなので同様に直接呼び出せない
# Product2.log('private')
