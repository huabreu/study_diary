require 'io/console'

INSERT = 1
VIEW = 2
SEARCH = 3
MARK_AS_DONE = 4
EXIT = 9

def welcome()
    puts "\nBem-vindo ao Diario de Estudos, seu companheiro para estudar!"
end

def menu()
    puts <<~MENU
    ------------------------------------------------
    [#{INSERT}] Cadastrar um item para estudar
    [#{VIEW}] Ver todos os itens cadastrados
    [#{SEARCH}] Buscar um item de estudo
    [#{MARK_AS_DONE}] Marcar um item como concluido
    [#{EXIT}] Sair
    ------------------------------------------------
    MENU
    print "Escolha uma opcao: "
    gets.to_i()
end

def insert_itens()
    print "\nDigite o titulo do seu item de estudo: "
    title = gets.chomp()
    print "Escolha uma categoria para o seu item de estudos: "
    category = gets.chomp()
    puts "\nItem #{title} da categoria #{category} cadastrado com sucesso!"
    { title: title, category: category, done: false}
end

def print_items(collection)
    collection.each.with_index(1) do |i, index|
        puts "##{index} - #{i[:title]} - #{i[:category]}#{' - Finalizado' if i[:done]}"
    end
    if collection.empty?
        puts "Nenhum item cadastrado"
    end
end

def search_item(collection)
    print 'Digite uma palavra para procurar: '
    word = gets.chomp()
    collection.filter do |i|
        i[:title].include? word
    end
end

def mark_as_done(items)
    not_finalized = items.filter {|i| !i[:done]}
    print_items(not_finalized)
    return if not_finalized.empty?

    print 'Digite o numero do item que deseja finalizar: '
    index = gets.to_i
    not_finalized[index-1][:done] = true
end

def clear
    $stdout.clear_screen
end

def wait_keypress
    puts "\nPressione qualquer tecla para continuar"
    $stdin.getch
end

def wait_and_clear
    wait_keypress
    clear
end

clear

welcome()

items = []

option = menu

loop do
    case option
    when INSERT 
        items << insert_itens()
    when VIEW
        print_items(items)
    when SEARCH
        found_items = search_item(items)
        print_items(found_items)
    when MARK_AS_DONE
        mark_as_done(items)
    when EXIT
        break
    else 
        puts "Opcao invalida!"
    end
    wait_and_clear
    option = menu
end

puts "\nObrigado por usar o Diario de Estudos!"