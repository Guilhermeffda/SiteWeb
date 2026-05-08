# Loja Online com Ruby on Rails
PS: eu acabei por sem querer apagar o antigo repositorio, por isso que vai aparecer que foi tudo mandado de uma vez
Este é um projeto desenvolvido seguindo o livro **Agile Web Development with Rails 7**. O objetivo é construir uma loja virtual simples utilizando o framework **Ruby on Rails**, com funcionalidades completas de gerenciamento de produtos, carrinho de compras, pedidos e envio de notificações por e-mail.

(O site esta com alguns problemas na parte dos test, mas nada que afete o site principal. E tambem tive que remover a parte do Docker temporariamente, mas eu voltarei a mexer nele no futuro)

(Os problemas na parte de test se da por causa da simulação de emails, onde os emails são enviados, porem o simulador esta tendo problemas para responder os email)

(Caso voce tente rodar o projeto em uma maquina com sistema operacional Windows, alguns comandos serão diferentes, os comandos a baixo são para linux, no meu caso o Ubuntu)

## Funcionalidades

- Listagem e visualização de produtos
- Adição de produtos ao carrinho de compras
- Edição e remoção de itens do carrinho
- Finalização de pedidos com formulário
- Envio de e-mails de confirmação de pedido
- Área administrativa para gerenciar produtos e pedidos

## Tecnologias Utilizadas

- Ruby on Rails 7/8
- SQLite3 (banco de dados local)
- Tailwind CSS (estilização)
- Turbo / Stimulus (funcionalidades reativas)
- Action Mailer (envio de e-mails)
- Docker (opcional)

## Como Rodar Localmente

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

<img width="1831" height="920" alt="Captura de tela de 2025-06-26 14-25-54" src="https://github.com/user-attachments/assets/c460161e-8c75-4a45-aa39-c68f574f9d99" />


## Funcionalidades do Site

O site é uma loja virtual simples. Ele permite que os usuários explorem produtos e realizem pedidos, enquanto os administradores podem gerenciar os itens da loja.

### Para Visitantes / Clientes

- **Visualização de produtos**: A página inicial exibe uma lista com os produtos disponíveis, com nome, descrição, preço e imagem. Aqui tambem pode ser mudado a lingua do site, tendo como opções Inglês, Português e Espanhol, nas imagens irei seguir usando a lingua Inglesa.
- **Adição ao carrinho**: O cliente pode adicionar produtos ao carrinho de compras com um clique.

<img width="1831" height="920" alt="Captura de tela de 2025-06-26 14-32-30" src="https://github.com/user-attachments/assets/97a25de0-fa9d-4463-96b3-f29bb1221f20" />

- **Gerenciamento do carrinho**:

<img width="1016" height="393" alt="Captura de tela de 2025-06-26 14-37-42" src="https://github.com/user-attachments/assets/a254c061-0396-48c6-a108-92cc2a70355b" />

  - Visualizar todos os itens no carrinho
  - Remover produtos individualmente
    
- **Finalizar pedido**:
  - Preencher um formulário com nome, endereço, e-mail e forma de pagamento
  - Ao enviar o pedido, o carrinho é esvaziado automaticamente
  - Caso voce tente fazer um pedido sem preencher alguma informação ira aparecer uma mensagem lhe avisando
    
<img width="1828" height="911" alt="Captura de tela de 2025-06-26 14-39-38" src="https://github.com/user-attachments/assets/0ccaacc7-0d23-4dd2-8be8-7a051de0a600" />

- **Confirmação por e-mail**: Um e-mail automático é enviado ao cliente confirmando o pedido.

### Para Administradores

- **Autenticação básica**: O painel administrativo é protegido por login e senha.
<img width="893" height="538" alt="Captura de tela de 2025-06-26 15-04-23" src="https://github.com/user-attachments/assets/db8278cf-33ae-4887-9d5d-6ca8eaf3eff6" />

- A adição do usuario pode ser feita de dois jeitos, com um usuario criando um outro usuario dentro do proprio site, na pagina de users
  
<img width="893" height="538" alt="Captura de tela de 2025-06-26 15-08-06" src="https://github.com/user-attachments/assets/6ebe1f16-56cd-481a-8c20-2889ac0d152c" />

- E o outro metodo é necessario adicionar um usuario dentro do proprio banco de dados.

- **Gerenciamento de produtos**:
  Ao acessar a pagina Products como administradores podemos interagir com os produtos

<img width="868" height="898" alt="Captura de tela de 2025-06-26 15-12-06" src="https://github.com/user-attachments/assets/5d4b1980-e09f-4577-8b6c-ce2eaa066998" />

  - Criar, editar e excluir produtos
  - Upload de imagens e definição de preços
  - 
<img width="598" height="720" alt="Captura de tela de 2025-06-26 15-13-04" src="https://github.com/user-attachments/assets/26df9a09-25d1-4260-a7a9-0a2b0367e491" />
    
- **Visualização de pedidos**:
  
<img width="883" height="778" alt="Captura de tela de 2025-06-26 15-16-33" src="https://github.com/user-attachments/assets/71570927-e0d6-4601-b735-4d7160fa29b0" />

  - Lista completa dos pedidos realizados
  - Acesso aos detalhes de cada pedido (nome, endereço, produtos comprados, etc.)
    
- **Notificação por e-mail**:
  (Os emails só são recebidos se forem mandados atravez da http://localhost:3000/rails/conductor/action_mailbox/inbound_emails, já que é apenas um site de desenvolvimento para teste optei por não colocar com emails reais)
  
<img width="990" height="793" alt="Captura de tela de 2025-06-26 15-23-26" src="https://github.com/user-attachments/assets/e07d245d-e269-4377-b4f1-608ea28a8089" />
  (Eu irei formatar melhor no futuro, por enquanto o essa parte esta meio "seca")

  - O administrador recebe uma notificação por e-mail sempre que um novo pedido é feito, podendo responder ele e enviar.




