

# Nesse arquivo, você pode criar registros iniciais para o banco de dados.
# Aqui estamos populando a tabela de produtos com um produto

# Lembre-se de que este arquivo é executado apenas uma vez, quando você executa o comando bin/rails db:seed
# Se você quiser adicionar mais produtos, basta seguir o mesmo padrão abaixo.



# Excluindo todos os produtos existentes para evitar duplicação
Product.delete_all


# Como da para ver aqui usamos o %{  %} para qual sera a parte de HTML do codigo
# e o restante devinimos com hashes


# .create!() é um metodo proprio do rails, para criar um novo registro no banco de dados
# e o ! significa que se houver algum erro, o rails ira levantar uma exceção


Product.create!(title: 'Docker for Rails Developers',
  description:
    %{<p>
      <em>Build, Ship, and Run Your Applications Everywhere</em> Docker does
      for DevOps what Rails did for web development—it gives you a new set
      of superpowers. Gone are “works on my machine” woes and lengthy setup
      tasks, replaced instead by a simple, consistent, Docker-based
      development environment that will have your team up and running in
      seconds.  Gain hands-on, real-world experience with a tool that’s
      rapidly becoming fundamental to software development. Go from zero all
      the way to production as Docker transforms the massive leap of
      deploying your app in the cloud into a baby step.
      </p>},
  image_url: 'ridocker.jpg',
  price: 19.95)



Product.create!(title: 'Design and Build Great Web APIs',
  description:
    %{<p>
      <em>Robust, Reliable, and Resilient</em>
      APIs are transforming the business world at an increasing pace. Gain
      the essential skills needed to quickly design, build, and deploy
      quality web APIs that are robust, reliable, and resilient. Go from
      initial design through prototyping and implementation to deployment of
      mission-critical APIs for your organization. Test, secure, and deploy
      your API with confidence and avoid the “release into production”
      panic. Tackle just about any API challenge with more than a dozen
      open-source utilities and common programming patterns you can apply
      right away.
      </p>},
  image_url: 'maapis.jpg',
  price: 24.95)


Product.create!(title: 'Modern CSS with Tailwind',
  description:
    %{<p>
      <em>Flexible Styling Without the Fuss</em>
      Tailwind CSS is an exciting new CSS framework that allows you to
      design your site by composing simple utility classes to create complex
      effects. With Tailwind, you can style your text, move your items on
      the page, design complex page layouts, and adapt your design for
      devices from a phone to a wide-screen monitor. With this book, you’ll
      learn how to use the Tailwind for its flexibility and its conPelo que vejo na sua captura de tela, você já tem:

sistency,
      from the smallest detail of your typography to the entire design of
      your site.
      </p>},
  image_url: 'tailwind.jpg',
  price: 18.95)
