namespace :stories do
  desc 'Update storys SPA with latest stories'
  task :update do
    ruby "-I~/key/storys/lib ~/key/storys/bin/storys Stories/"
  end

  desc 'Run all stories tasks'
  task all: [:update]
end

desc 'Run all stories tasks'
task stories: 'stories:all'