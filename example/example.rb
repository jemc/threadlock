require 'threadlock'

class A
  
  def foo
    puts 'foo'
    sleep 0.2
    bar
  end
  
  def bar
    puts '   bar'
  end
  
  # Make specific instance methods "thread safe"
  threadlock :foo, :bar
  
  # Make all instance methods "thread safe"
  # threadlock instance_methods
  
  # Make all non-inherited instance methods "thread safe"
  # threadlock instance_methods-superclass.instance_methods
  
  # Use user specified lock names
  # threadlock :foo, lock: :@foolock
  # threadlock :bar, lock: :@barlock
end

a = A.new
Thread.new {a.foo}
Thread.new {a.foo}

sleep 0.5