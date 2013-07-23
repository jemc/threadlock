Gem::Specification.new do |s|
  s.name          = 'threadlock'
  s.version       = '1.2.1'
  s.date          = '2013-07-22'
  s.summary       = \
    "threadlock: Easy, featherweight thread protection for basic ruby objects."
  s.description   = \
    "Use the threadlock function in your class definition to automatically run"\
    " instance methods inside of an instance-wide re-entrant lock (Monitor). "\
    " All locked methods in an instance are protect by a single lock.  You can"\
    " protect all or some of your methods from being run asynchronously.  The"\
    " goal is to be able to easily make basic objects threadsafe with as"\
    " little thought and code as using the attr_accessor family of functions"\
    " to make your instance attributes accessible.  The codebase is small and"\
    " I intend to keep it that way, but bug reports and patches are welcome. "\
    " \n Enjoy."
    
  s.authors       = ["Joe McIlvain"]
  s.email         = 'joe.eli.mac@gmail.com'
  s.files         = Dir["{lib}/**/*.rb", "bin/*", "LICENSE", "*.md"]
  s.require_path  = 'lib'
  s.homepage      = 'https://github.com/jemc/threadlock/'
  s.licenses      = ["MIT License",
                     "Copyright 2013 Joe McIlvain"]
end