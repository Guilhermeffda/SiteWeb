
require "active_model/serializers/xml"
require Rails.root.join("lib", "tasks", "pago")

class Order < ApplicationRecord
    has_many :line_items, dependent: :destroy

    enum :pay_type, {
        "Check" => 0,
        "Credit card" => 1,
        "Purchase order" => 2
    }

    validates :name, :address, :email, presence: true
    validates :pay_type, inclusion: pay_types.keys


    def add_line_items_from_cart(cart)
        cart.line_items.each do |item|
            item.cart_id = nil
            line_items << item
        end
    end

    # Esse metodo é resposavel por preocessar o pagamento
    def charge!(pay_type_params)

        # Cria um hash vazio para armazenardetalhes da compra
        # E cria uma variavel para guardar qual foi o metodo de compra
        payment_details = {}
        payment_method = nil

        # Aqui temos o case que vai adiocionar as informacoes da compra dependendo de qaul foi
        case pay_type
        when "Check"
            payment_method = :check
            payment_details[:routing] = pay_type_params[:routing_number]
            payment_details[:account] = pay_type_params[:account_number]
        when "Credit card"
            payment_method = :credit_card
            month, year = pay_type_params[:expiration_date].split(//)
            payment_details[:cc_num] = pay_type_params[:credit_card_number]
            payment_details[:expiration_month] = month
            payment_details[:expiration_year] = year
        when "Purchase order"
            payment_method = :po
            payment_details[:po_num] = pay_type_params[:po_number]
        end

        # Aqui realiza o pagamento conforme o ID da compra
        payment_result = ::Pago.make_payment(
            order_id: id,
            payment_method: payment_method,
            payment_details: payment_details
        )

        # Se o pagamento for bem sucedido, é enviado o email da confirmação
        if payment_result.succeeded?
            OrderMailer.received(self).deliver_later
        # Caso de errado, vai lancar um erro
        else
            raise payment_result.error
        end
    end
end