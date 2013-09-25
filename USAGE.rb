$LOAD_PATH.unshift(File.expand_path("./lib", File.dirname(__FILE__)))
require 'threadlock'


class Example1
  
  def foo
    @foo = true
    raise "not synchronized!" if @bar
    sleep 0.2
    raise "not synchronized!" if @bar
    @foo = false
  end
  
  def bar
    @bar = true
    raise "not synchronized!" if @foo
    sleep 0.2
    raise "not synchronized!" if @foo
    @bar = false
  end
  
  # Wrap foo and bar methods in a re-entrant lock
  threadlock :foo
  threadlock :bar
  
end


class Example2
  
  def foo
    @foo = true
    raise "not synchronized!" if @bar
    sleep 0.2
    raise "not synchronized!" if @bar
    @foo = false
  end
  
  def bar
    @bar = true
    raise "not synchronized!" if @foo
    sleep 0.2
    raise "not synchronized!" if @foo
    @bar = false
  end
  
  # Wrap foo and bar methods in a re-entrant lock
  threadlock :foo, :bar
  
end


class Example3
  
  def foo
    @foo = true
    raise "not synchronized!" if @bar
    sleep 0.2
    raise "not synchronized!" if @bar
    @foo = false
  end
  
  def bar
    @bar = true
    raise "not synchronized!" if @foo
    sleep 0.2
    raise "not synchronized!" if @foo
    @bar = false
  end
  
  # Wrap all newly defined instance methods in a re-entrant lock
  threadlock instance_methods(false)
  
end


class Example4
  
  def foo
    @foo = true
    raise "not synchronized!" if @bar
    sleep 0.2
    raise "not synchronized!" if @bar
    @foo = false
  end
  
  def bar
    @bar = true
    raise "not synchronized!" if @foo
    sleep 0.2
    raise "not synchronized!" if @foo
    @bar = false
  end
  
  # Wrap foo and bar methods in a re-entrant lock named custom_lock_name
  # (default lock name is :@__threadlock__)
  threadlock :foo, :bar, :lock=>:@custom_lock_name
  
end


class Example5
  
  def initialize
    @custom_lock_name = Mutex.new
  end
  
  def foo
    @foo = true
    raise "not synchronized!" if @bar
    sleep 0.2
    raise "not synchronized!" if @bar
    @foo = false
  end
  
  def bar
    @bar = true
    raise "not synchronized!" if @foo
    sleep 0.2
    raise "not synchronized!" if @foo
    @bar = false
  end
  
  # Wrap foo and bar methods in a mutex instead of a re-entrant lock
  threadlock :foo, :bar, :lock=>:@custom_lock_name
  
end


class Example6 # Ruby 2.1 only
  
  # Ruby 2.1 only: wrap new method foo in a re-entrant lock
  threadlock def foo
    @foo = true
    raise "not synchronized!" if @bar
    sleep 0.2
    raise "not synchronized!" if @bar
    @foo = false
  end
  
  def bar
    @bar = true
    raise "not synchronized!" if @foo
    sleep 0.2
    raise "not synchronized!" if @foo
    @bar = false
  end
  
  # Wrap method bar in the same re-entrant lock
  threadlock :bar
  
end if RUBY_VERSION>="2.1.0"


# Run tests on Example classes - raise if error
[
  Example1,
  Example2,
  Example3,
  Example4,
  Example5,
 (Example6 if RUBY_VERSION>="2.1.0"), # Ruby 2.1 only
].each do |cls|
  break unless cls
  puts "testing #{cls}"
  obj = cls.new
  [Thread.new { obj.foo }, Thread.new { obj.bar }]
    .each { |t| t.join }
end

puts "passed tests!"