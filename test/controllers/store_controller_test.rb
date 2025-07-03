require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select "nav a", minimum: 4 # verifica se que há pelo menos 4 links na aba de navegação
    assert_select "main ul li", 3 # verifica se há 3 itens na lista principal
    assert_select "h2", "Programming Ruby 1.9" # verifica se o título do livro está presente
    assert_select "div", /\$[,\d]+\.\d\d/ # verifica se o preço do livro está formatado corretamente
  end
end
