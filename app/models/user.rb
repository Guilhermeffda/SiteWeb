
class User < ApplicationRecord
  # O has_secure_password() garante que o modelo User
  # tenha funcionalidades de autenticação, como validação de senha
  # e geração de hash de senha.
  has_secure_password

  after_destroy :ensure_an_admin_remains

  class Error < StandardError; end

  private

  def ensure_an_admin_remains
    if User.count.zero?
      raise Error.new("Can't delete last user")
    end
  end
end
