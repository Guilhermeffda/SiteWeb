namespace :cleanup do
  desc "Remove todos os arquivos antigos do diretório tmp, exceto .keep e restart.txt"
  task :old_files do
    Dir.glob("tmp/**/*").each do |file|
      next if File.directory?(file)
      next if [ ".keep", "restart.txt" ].include?(File.basename(file))
      File.delete(file)
    end
    puts "Arquivos removidos, exceto .keep e restart.txt!"
  end
end
