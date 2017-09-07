# frozen_string_literal: true

desc 'Check website'
task :check do
  puts '--> bundle exec rubocop'
  status = system('bundle exec rubocop')
  puts status ? '--> OK' : 'FAILED'
  puts

  puts '--> bundle exec haml-lint -c .haml_lint.yml source/'
  status = system('bundle exec haml-lint -c .haml_lint.yml source/')
  puts status ? '--> OK' : 'FAILED'
  puts

  puts '--> bundle exec scss-lint source/'
  status = system('bundle exec scss-lint source/')
  puts status ? '--> OK' : 'FAILED'
  puts
end

desc 'Build website'
task :build do
  puts '--> Building website (bundle exec middleman build --clean --parallel)'
  status = system('bundle exec middleman build --clean --parallel')
  puts status ? '--> OK' : 'FAILED'
  puts
end

desc 'Deploy website'
task :deploy do
  puts '--> Deploying website (rsync -avzr --delete -e ssh build/ deployer@geophystech.ru:/opt/geophystech.ru)'
  status = system('rsync -avzr --delete -e ssh build/ deployer@geophystech.ru:/opt/geophystech.ru')
  puts status ? '--> OK' : 'FAILED'
  puts
end
