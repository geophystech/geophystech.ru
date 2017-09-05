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
