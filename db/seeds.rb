[
  'Младший программист',
  'Программист',
  'Старший программист',
  'Ведущий программист',
].each do |name|
  Position.create(:name => name)
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
  SkillType.create(:name => name)
end