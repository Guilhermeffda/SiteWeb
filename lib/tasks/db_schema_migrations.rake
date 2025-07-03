

# aqui estamos definindo uma tarefa Rake que imprime as versões migradas do banco de dados.
# A tarefa é definida dentro do namespace :db, que é um padrão comum para tarefas relacionadas ao banco de dados em aplicações Rails.

namespace :db do
    desc "Prints the migrated versions"
    task schema_migrations: :environment do
        puts ActiveRecord::Base.connection.select_values(
        "select version from schema_migrations order by version")
    end
end
