

# Esse arquivo define o modelo Product, que representa um produto em nossa aplicação.
# Esse modelo inclui validações para garantir que os atributos do produto sejam preenchidos corretamente.
# app/models/product.rb

class Product < ApplicationRecord

    # Aqui definimos que um produto pode ter muitos itens de linha associados a ele.
    has_many :line_items
    # Aquio é um callback que chama o método ensure_not_referenced_by_nay_line_item
    before_destroy :ensure_not_referenced_by_nay_line_item



    # O validates checa se os atributos estão preenchidos
        # O presence faz com que o atributo seja obrigatório
    validates :title, :description, :image_url, presence: true 
    # Aqui fazemos com que para o numero seja so valido se for maior ou igual a 0.01
    validates :price, numericality: { greater_than_or_equal_to: 0.01 }
    # Faz com que mão seja permitidos titulos iguais
    validates :title, uniqueness: true
    # Aqui vai checar se o formato esta entre URL para GIF, JPG ou PNG, caso não for, não sera permitido
        # Usamos as expressões regulares para validar caracteres apos o ponto
   validates :image_url, allow_blank: true, format: {
        with: /\Ahttps?:\/\/.+(\.(gif|jpg|png))\z/i,
        message: 'deve ser uma URL válida para imagem GIF, JPG ou PNG'
    }         #o "\z" indica o fim de uma String, e o "i" transforma todos o caracteres em minúsculos(no caso os que buscamos)


    # Esse método é chamado antes de um produto ser destruído
    # Ele verifica se o produto está referenciado por algum item de linha.
    # Se estiver, impede a destruição do produto e lança um erro.   
    # Se não estiver referenciado, o produto pode ser destruído normalmente.
    private 
    
        def ensure_not_referenced_by_nay_line_item
            unless line_items.empty?
                errors.add(:base, 'Line iitems present')
                throw :abort
            end
        end
        
end
