
Gem::Specification.new do |s|
  s.name          = 'threadlock'
  s.version       = '2.0.0'
  s.date          = '2013-12-19'
  s.summary       = \
    "threadlock: Easy, featherweight thread protection for basic ruby objects."
  s.description   = \
    "Use the threadlock method in your class definition to automatically run"\
    " instance methods inside of an instance-wide re-entrant lock (Monitor). "\
    " All locked methods in an instance are protected by a single lock, unless"\
    " a specific lock is specified. "\
    " You can protect all or some of your methods from being run concurrently. "\
    " In Ruby>=2.1, threadlock can also be used as a syntactic decorator. "\
    " \n Enjoy."
    
  s.authors       = ["Joe McIlvain"]
  s.email         = 'joe.eli.mac@gmail.com'
  s.files         = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md", "USAGE.rb"]
  s.require_path  = 'lib'
  s.homepage      = 'https://github.com/jemc/threadlock/'
  s.licenses      = ["MIT License",
                     "Copyright 2013 Joe McIlvain"]
end
