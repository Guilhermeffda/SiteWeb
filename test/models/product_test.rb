
# Esse arquivo faz a parte de testes do modelo Product.
# Ele verifica se a URL da imagem do produto é válida.
# Se a URL for válida, o teste passa; se não, o teste falha.
# frozen_string_literal: true

# Teste do modelo Product
# Verifica se a URL da imagem é válida
# Testa URLs válidas e inválidas
# Utiliza fixtures para carregar dados de teste


require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def new_product(image_url)
    Product.new(
      title: "My Book Title",
      description: "yyy",
      price: 1,
      image_url: image_url
    )
  end

  test "image url" do
    ok = %w[
      fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
      http://a.b.c/x/y/z/fred.gif
    ]

    bad = %w[
      fred.doc fred.gif/more fred.gif.more
    ]

    ok.each do |image_url|
      assert new_product(image_url).valid?,
            "#{image_url} must be valid"
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?,
            "#{image_url} must be invalid"
    end
  end


  test "product is not valid without a unique title" do
    product = Product.new(title:  products(:ruby).title,
        description: "yyy",
        price:  1,
        image_url:  "fred.gif")
    assert product.invalid?
    assert_equal [I18n.translate('errors.messages.taken')],
        product.errors[:title]
  end

  test "should reject invalid image URLs" do
    invalid_urls = [
      "javascript:alert('hacked')",
      "http://malicious.com/script.jpg?execute=true",
      "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA",
      "image.png<script>malicious()</script>"
    ]
    
    invalid_urls.each do |url|
      product = Product.new(image_url: url)
      assert_not product.valid?, "#{url} não deve ser válido"
    end
  end

  test "should accept valid image URLs" do
    valid_urls = [
      "http://exemplo.com/imagem.jpg",
      "https://secure-site.com/foto.png",
      "https://cdn.exemplo.com/images/photo.gif"
    ]
    
    valid_urls.each do |url|
      product = Product.new(image_url: url)
      assert product.valid?, "#{url} deve ser válido"
    end
  end

end
