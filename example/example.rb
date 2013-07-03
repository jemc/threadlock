require_relative '../lib/threadlock'

class A
  
  def foo
    puts 'foo'
    sleep 0.2
    bar
  end
  
  def bar
    puts '   bar'
  end
  
  # Make specific instance methods thread safe
  threadlock :foo, :bar
  
  # Make all instance methods thread safe
  # threadlock self.instance_methods
end

a = A.new
Thread.new {a.foo}
Thread.new {a.foo}

sleep 0.5