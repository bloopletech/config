namespace :videos do
  desc 'Update videos SPA with latest videos'
  task :update do
    sh "chmod -R 755 Videos/"
    sh "videos Videos/"
  end

  desc 'Run all videos tasks'
  task all: [:update]
end

desc 'Run all videos tasks'
task videos: 'videos:all'