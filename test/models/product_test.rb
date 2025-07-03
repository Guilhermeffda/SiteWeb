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
      https://secure.com/foto.png?tamanho=grande
      imagem.png?param=valor
      foto.JPG#anchor
      imagem.gif?query=value#anchor
    ]

    bad = %w[
      fred.doc fred.gif/more fred.gif.more
      imagem.gif.txt
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
    product = Product.new(
      title: products(:ruby).title,
      description: "yyy",
      price: 1,
      image_url: "fred.gif"
    )
    assert product.invalid?
    assert_equal [ I18n.translate("errors.messages.taken") ],
                 product.errors[:title]
  end

  test "should_accept_valid_image_URLs" do
    valid_urls = [
      "fred.gif",
      "imagem.JPG",
      "/caminho/para/imagem.png",
      "http://exemplo.com/imagem.jpg",
      "https://secure.com/foto.png?tamanho=grande",
      "imagem.png?param=valor",
      "foto.JPG#anchor",
      "imagem.gif?query=value#anchor"
    ]

    valid_urls.each do |url|
      product = Product.new(
        title: "Produto Válido #{url}",
        description: "Descrição válida",
        price: 10,
        image_url: url
      )
      assert product.valid?,
             "#{url} deve ser válido. Erros: #{product.errors.full_messages.join(', ')}"
    end
  end

  test "should_reject_invalid_image_URLs" do
    invalid_urls = [
      "arquivo.doc",
      "imagem.gif.txt",
      "javascript:alert('hacked')",
      "dados:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUA"
    ]

    invalid_urls.each do |url|
      product = Product.new(
        title: "Produto Inválido #{url}",
        description: "Descrição inválida",
        price: 10,
        image_url: url
      )
      assert_not product.valid?, "#{url} não deve ser válido"
    end
  end
end
