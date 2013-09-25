
require 'threadlock'


class Example1
  
  def foo
    "foo"
  end
  
  def bar
    "bar"
  end
  
  # Wrap foo and bar methods in a re-entrant lock
  threadlock :foo
  threadlock :bar
  
end


class Example2
  
  def foo
    "foo"
  end
  
  def bar
    "bar"
  end
  
  # Wrap foo and bar methods in a re-entrant lock
  threadlock :foo, :bar
  
end


class Example3
  
  def foo
    "foo"
  end
  
  def bar
    "bar"
  end
  
  # Wrap all newly defined instance methods in a re-entrant lock
  threadlock instance_methods(false)
  
end


class Example4
  
  def foo
    "foo"
  end
  
  def bar
    "bar"
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
    "foo"
  end
  
  def bar
    "bar"
  end
  
  # Wrap foo and bar methods in a mutex instead of a re-entrant lock
  threadlock :foo, :bar, :lock=>:@custom_lock_name
  
end


class Example6
  
  # Ruby 2.1 only: wrap new method foo in a re-entrant lock
  threadlock def foo
    "foo"
  end
  
  def bar
    "bar"
  end
  
  # Wrap method bar in the same re-entrant lock
  threadlock :bar
  
end

