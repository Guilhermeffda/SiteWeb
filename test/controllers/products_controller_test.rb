require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @title = "The graet book"
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

test "should create product" do
  assert_difference("Product.count") do
    post products_url, params: {
      product: {
        title: "Novo Produto",
        description: "Descrição do novo produto",
        image_url: "produto.jpg",
        price: 9.99
        }
      }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
  patch product_url(@product), params: {
    product: {
      title: "Produto Atualizado",
      image_url: "atualizado.png"
    }
  }

    assert_redirected_to product_url(@product)
    @product.reload
    assert_equal "Produto Atualizado", @product.title
  end

  # Aqui definimos que não podemos deletar um produto que esteja no carrinho
  test "can't delete product in cart" do
    delete product_url(products(:two))

    assert Product.exists?(products(:two).id), "Produto não deveria ter sido deletado"
    assert_redirected_to products_url
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
