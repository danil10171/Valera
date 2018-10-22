require_relative 'valera.rb'
require_relative 'stats.rb'
require_relative 'actions.rb'
require_relative 'view.rb'

stat = Stats.new
yml = stat.load("stats.yml")
valera = Valera.new({:health => yml['health'], :mana => yml['mana'], :money => yml['money'], :happiness => yml['happiness'], :fatigue => yml['fatigue'], :dead => 0})

view = View.new
view.welcome

while valera.dead? != 1
  view.actions
  print "> "
  action_choise = gets.chomp

  action = Actions.new
  case action_choise
    when "1"
      view.stat(valera)
    when "2"
	  if (valera.mana > 50 || valera.fatigue > 10)
	    puts "Валера не может пойти на работу т.к он либо пьян либо устал но разницы нет.\n"
      else
	    puts "Валера сходил на работу\n"
	    action.go_to_work(valera)
	  end
    when "3"
      puts "Валера сходил в парк отдохнуть и насладиться природой. Он немного устал.\n"
      action.see_nature(valera)
    when "4"
      if valera.money < 20
        puts "Недостаточно денег\n"
      else
        puts "Валера открыл бутылку вина и посмотрел новую серию сериала\n"
        action.drink_wine_and_tv_watch(valera)
      end
    when "5"
      if valera.money < 100
        puts "Недостаточно денег\n"
      else
        puts "Валера сходил в бар отдохнуть\n"
        action.go_to_bar(valera)
      end
    when "6"
      if valera.money < 150
        puts "Недостаточно денег\n"
      else
        puts "Вы сходили отохнуть со своими маргинальными друзьями\n"
        action.drink_with_marginals(valera)
      end
    when "7"
      if (valera.mana > 40 && valera.mana < 70)
        puts "Вы устроили соло концерт в метро и смогли немного заработать денег\n"
      else
        puts "Пока вы пели в метро вы выпили банку пива и устали. Денег заработать не удалось.\n"
      end
      action.sing_in_metro(valera)
    when "8"
      if (valera.mana < 30)
        puts "Вы хорошо выспались\n"
      else
        puts "Вы проснулись но чувствовали себя не очень хорошо\n"
      end
      action.sleep(valera)
    when "9"
      puts "Вы сделали сохранение.\n"
      stat.save('save.yml', valera)
    when "10"
      stat = Stats.new
      yml = stat.load("save.yml")
      valera = Valera.new({:health => yml['health'], :mana => yml['mana'], :money => yml['money'], :happiness => yml['happiness'], :fatigue => yml['fatigue'], :dead => 0})
    else
      puts "Действия на данную кнопку нет.\n"
  end
end

view.stat(valera)
view.dead
