# Loja Online com Ruby on Rails
PS: eu acabei por sem querer apagar o antigo repositorio, por isso que vai aparecer que foi tudo mandado de uma vez
Este é um projeto desenvolvido seguindo o livro **Agile Web Development with Rails 7**. O objetivo é construir uma loja virtual simples utilizando o framework **Ruby on Rails**, com funcionalidades completas de gerenciamento de produtos, carrinho de compras, pedidos e envio de notificações por e-mail.

(O site esta com alguns problemas na parte dos test, mas nada que afete o site principal. E tambem tive que remover a parte do Docker temporariamente, mas eu voltarei a mexer nele no futuro)

(Os problemas na parte de test se da por causa da simulação de emails, onde os emails são enviados, porem o simulador esta tendo problemas para responder os email)

(Caso voce tente rodar o projeto em uma maquina com sistema operacional Windows, alguns comandos serão diferentes, os comandos a baixo são para linux, no meu caso o Ubuntu)

## ✨ Funcionalidades

- Listagem e visualização de produtos
- Adição de produtos ao carrinho de compras
- Edição e remoção de itens do carrinho
- Finalização de pedidos com formulário
- Envio de e-mails de confirmação de pedido
- Área administrativa para gerenciar produtos e pedidos

## 🛠️ Tecnologias Utilizadas

- Ruby on Rails 7/8
- SQLite3 (banco de dados local)
- Tailwind CSS (estilização)
- Turbo / Stimulus (funcionalidades reativas)
- Action Mailer (envio de e-mails)
- Docker (opcional)

## ⚙️ Como Rodar Localmente

### Pré-requisitos

- Ruby (>= 3.0)
- Rails (>= 7.0)
- Node.js e Yarn (para assets)
- SQLite3
- (Opcional) Docker e Docker Compose

### Passos

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/seu-repo.git
   cd SiteWeb

2. Instale as dependências:
   ```bash
   bundle install
   yarn install

3. Configure o banco de dados:
   ```bash
   bin/rails db:setup

4. Rode o servidor:
   ```bash
   bin/rails server
      Ou
   bin/rails s

5. Acesse o site em: http://localhost:3000/

## Usando Docker (opcional)
Você também pode rodar o projeto com Docker. Veja as instruções no arquivo Dockerfile e docker-compose.yml.

  ![image](https://github.com/user-attachments/assets/9300bbf5-a0ef-403b-938e-b63014634f34)

## ✨ Funcionalidades do Site

O site é uma loja virtual simples. Ele permite que os usuários explorem produtos e realizem pedidos, enquanto os administradores podem gerenciar os itens da loja.

### 🛍️ Para Visitantes / Clientes

- **Visualização de produtos**: A página inicial exibe uma lista com os produtos disponíveis, com nome, descrição, preço e imagem. Aqui tambem pode ser mudado a lingua do site, tendo como opções Inglês, Português e Espanhol, nas imagens irei seguir usando a lingua Inglesa.
- **Adição ao carrinho**: O cliente pode adicionar produtos ao carrinho de compras com um clique.

  ![image](https://github.com/user-attachments/assets/4ec14a84-4630-4556-aa25-d16111f644bd)

- **Gerenciamento do carrinho**:

  ![image](https://github.com/user-attachments/assets/3a3933f8-34ba-41da-a8de-de676144fbbe)

  - Visualizar todos os itens no carrinho
  - Remover produtos individualmente
    
- **Finalizar pedido**:
  - Preencher um formulário com nome, endereço, e-mail e forma de pagamento
  - Ao enviar o pedido, o carrinho é esvaziado automaticamente
  - Caso voce tente fazer um pedido sem preencher alguma informação ira aparecer uma mensagem lhe avisando
    
  ![image](https://github.com/user-attachments/assets/62579609-10ed-438e-bc08-e81a1dcdf82d)

- **Confirmação por e-mail**: Um e-mail automático é enviado ao cliente confirmando o pedido.

### 🔐 Para Administradores

- **Autenticação básica**: O painel administrativo é protegido por login e senha.
  ![image](https://github.com/user-attachments/assets/d559e694-3bf9-464e-bfaa-7a9fa981e259)

- A adição do usuario pode ser feita de dois jeitos, com um usuario criando um outro usuario dentro do proprio site, na pagina de users
  
  ![image](https://github.com/user-attachments/assets/cd16f76b-1ede-48ce-8133-5316fc21093d)

- E o outro metodo é necessario adicionar um usuario dentro do proprio banco de dados.

- **Gerenciamento de produtos**:
  Ao acessar a pagina Products como administradores podemos interagir com os produtos

  ![image](https://github.com/user-attachments/assets/a634c4ad-0876-433d-9ac9-7a5de1131b46)

  - Criar, editar e excluir produtos
  - Upload de imagens e definição de preços
  - 
  ![image](https://github.com/user-attachments/assets/ff86b925-c480-4106-88ce-4ced8de03cee)
    
- **Visualização de pedidos**:
  
  ![image](https://github.com/user-attachments/assets/75266696-8516-4659-b74d-28b97bc37da0)

  - Lista completa dos pedidos realizados
  - Acesso aos detalhes de cada pedido (nome, endereço, produtos comprados, etc.)
    
- **Notificação por e-mail**:
  (Os emails só são recebidos se forem mandados atravez da http://localhost:3000/rails/conductor/action_mailbox/inbound_emails, já que é apenas um site de desenvolvimento para teste optei por não colocar com emails reais)
  
  ![image](https://github.com/user-attachments/assets/6be5cc16-d25b-4442-92f5-fcd30adbca59)
  (Eu irei formatar melhor no futuro, por enquanto o essa parte esta meio "seca")

  - O administrador recebe uma notificação por e-mail sempre que um novo pedido é feito, podendo responder ele e enviar.




