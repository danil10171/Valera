class View
  def welcome
    puts "Начало игры\n"
  end

  def actions
    puts "Выберите действие:"
    puts "1) Пойти на работу\n"
    puts "2) Созерцать природу\n"
    puts "3) Пить вино и смотреть сериал\n"
    puts "4) Сходить в бар\n"
    puts "5) Выпить с маргинальными личностями\n"
    puts "6) Петь в метро\n"
    puts "7) Спать\n"
    puts "8) Сохранить\n"
    puts "9) Загрузить\n"
  end

  def stat(valera)
    puts "Здоровье = #{valera.health}\n"
    puts "Мана = #{valera.mana}\n"
    puts "Деньги = #{valera.money}\n"
    puts "Жизнерадостность = #{valera.happiness}\n"
    puts "Усталость = #{valera.fatigue}\n"
    puts "\n"
  end

  def dead
    puts "Игра окончена.\n"
  end
end
