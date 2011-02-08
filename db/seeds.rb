[
  'Admin',
  'HR',
].each do |name|
  role = Role.find_or_create_by_name(name)
  puts "Role: #{name} created"

  User.find_or_create_by_email("#{name.underscore}@example.com") do |u|
    u.password = '123456'
    u.full_name = name
    u.confirmed_at = Time.now
  end.roles << role

  puts "User: #{name.underscore}@example.com/123456 with role: #{name} created"
end

[
  'Младший программист',
  'Программист',
  'Старший программист',
  'Ведущий программист',
].each do |name|
  Position.find_or_create_by_name(name)
  puts "Position: #{name} created"
end

[
  'Общение',
  'Общение с заказчиком',
  'Работа в команде',
  'Работа в компании',
  'Анализ и выполнение задачи',
  'Обучение',
  'Блоги',
  'Инициативность',
  'Работа над проектом',
  'Выполняет норму поинтов в неделю',
  'Годы профессионального опыта',
  'Годы профессионального опыта использования платформы',
  'Организация кода в файле',
  'Читабельность кода',
  'Среда программирования (IDE)',
  'API',
  'Знание новейших технологий',
  'Знание внутренних аспектов платформы',
  'Знание Linux',
  'Знание HTTP',
  'Система контроля версий',
  'HTML',
  'CSS',
  'JS',
  'База данных',
  'Ruby',
  'Rails',
].each do |name|
  SkillType.find_or_create_by_name(name)
  puts "Skill type: #{name} created"
end
