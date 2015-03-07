path = File.dirname(File.realpath(__FILE__))
Dir.glob(File.join(path, 'tasks', '*.rake')).each { |r| import r }

task default: [:manga, :stories, :videos]