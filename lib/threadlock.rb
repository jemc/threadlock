require 'monitor'

def threadlock(*meths, lock: :@___threadlock___)
  meths.each do |meth|
    m = instance_method(meth)
    define_method(meth) do |*args|
      (instance_variable_get(lock) or \
       instance_variable_set(lock, Monitor.new))
      .synchronize do
        m.bind(self).call(*args)
      end
    end
  end
end
