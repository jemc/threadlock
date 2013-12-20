
require 'monitor'

module Threadlock
  
  def self.included(mod)
    mod.extend Threadlock
  end
  
  def threadlock(*meths, lock: :@___threadlock___)
    meths.flatten.each do |meth|
      m = instance_method(meth)
      define_method(meth) do |*args, &block|
        (instance_variable_get(lock) or \
         instance_variable_set(lock, Monitor.new))
        .synchronize do
          m.bind(self).call(*args, &block)
        end
      end
    end
  end
  
end
