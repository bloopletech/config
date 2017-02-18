namespace :manga do
  desc 'Update mangos SPA with latest manga'
  task :update do
    sh "cd Manga-OG && ./fixperms" rescue nil
    ruby "-I~/key/mangos/lib ~/key/mangos/bin/mangos Manga-OG/"
  end

  desc 'Run all manga tasks'
  task all: [:update]
end

desc 'Run all manga tasks'
task manga: 'manga:all'
