gemname = 'threadlock'

# Rebuild and push gem
task :default => [:gp]
task :gp do exec "
rm #{gemname}*.gem
gem uninstall #{gemname}
gem build #{gemname}.gemspec
gem install #{gemname}*.gem
gem push #{gemname}*.gem" end