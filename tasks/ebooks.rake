namespace :ebooks do
=begin
  task compile: FINISHED_BOOKS
=end
  desc 'Translate ebook documents in .html format into Kindle format, and then sync them to the Kindle'
  task :compile do
    require 'tempfile'

    mapping = Hash[FileList['Stories/*.html'].map do |source|
      [source, source.pathmap('Kindle Stories/%f').ext('.azw3')]
    end]

    #Delete extraneous targets
    (FileList['Kindle Stories/*.azw3'] - mapping.values).map { |e| rm e }

    #Exclude up-to date files
    mapping.reject! do |source, target|
      File.exists?(target) && (File.mtime(source) <= File.mtime(target))
    end

    #Build the targets
    tempfile = Tempfile.new('lines')
    mapping.keys.each { |source| tempfile.puts source }
    tempfile.close

    $VERBOSE = nil
    system('parallel', '--gnu', '-a', tempfile.path, 'ebook-convert', '{}', 'Kindle\\ Stories/{/.}.azw3')
    $VERBOSE = 1

    #Sync the targets to the kindle
    rsync_command = [
      'rsync',
      '-av',
      '--delete',
      "--include='*.azw3'",
      "--exclude='*'",
      '--modify-window=1',
      '--no-perms',
      "Kindle\\ Stories/",
      '/media/bloopletech/Kindle/documents/Stories/'
    ]
    system(rsync_command.join(' '))
  end

  desc 'Run all ebooks tasks'
  task all: [:compile]
end
=begin
rule '.azw3' => '.html' do |t|
  sh
  sh "pandoc -o #{t.name} #{t.source}"
end
=end

desc 'Run all ebooks tasks'
task ebooks: 'ebooks:all'