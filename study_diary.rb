INSERIR_ITENS = 1
VIZUALIZAR_ITENS = 2
BUSCAR_ITENS = 3
SAIR = 4

def bem_vindo()
    puts "\nBem-vindo ao Diario de Estudos, seu companheiro para estudar!"
end

def menu()
    puts "[#{INSERIR_ITENS}] Cadastrar um item para estudar"
    puts "[#{VIZUALIZAR_ITENS}] Ver todos os itens cadastrados"
    puts "[#{BUSCAR_ITENS}] Buscar um item de estudo"
    puts "[#{SAIR}] Sair"
    print "Escolha uma opcao: "
    gets.to_i()
end

def inserir_item()
    print "\nDigite o titulo do seu item de estudo: "
    titulo = gets.chomp()
    puts "\n#1 - Ruby\n#2 - Rails\n#3 - HTML\n#4 - JavaScript "
    print "Escolha uma categoria para o seu item de estudos: "
    categoria = gets.chomp().to_i
    puts "\nItem #{titulo} da categoria #{categoria} cadastrado com sucesso!"
    {titulo:titulo, categoria: categoria}
end

def imprimir_itens(itens)
    itens.each do |i|
        puts "#{i[:titulo]} - #{i[:categoria]}"
    end
    puts  
    if itens.empty?
        puts "Nenhum item cadastrado"
    end
end

def buscar_item(itens)
    print 'Digite uma palavra para procurar: '
    palavra = gets.chomp()
    itens.select {|i| i[:titulo].casecmp(palavra) == 0}
end

bem_vindo()

itens = []

opcao = menu()

loop do
    if opcao == INSERIR_ITENS 
        itens << inserir_item()
    elsif opcao == VIZUALIZAR_ITENS
        imprimir_itens(itens)
    elsif opcao == BUSCAR_ITENS
        buscar_item(itens)
    elsif opcao == SAIR
        break
    else 
        puts "Opcao invalida!"
    end
    opcao = menu()
end

puts "\nObrigado por usar o Diario de Estudos!"