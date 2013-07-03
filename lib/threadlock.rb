require 'monitor'

def threadlock(*funcs)
  for f in funcs.flatten
    f2 = f.to_s
          .gsub(/\=/, "_eQUAL")
          .gsub(/\!/, "_nOT")
          .gsub(/\~/, "_tILDE")
          .gsub(/\</, "_lESS")
          .gsub(/\>/, "_mORE")
          .gsub(/\+/, "_aDD")
          .gsub(/\-/, "_sUB")
          .gsub(/\*/, "_mULT")
          .gsub(/\//, "_dIV")
          .gsub(/\//, "_mOD")
          .gsub(/^/, "___")
    
    class_eval\
    ("
      alias :#{f2} :#{f}
      def #{f}(*args)
        @___threadlock___ ||= Monitor.new
        @___threadlock___.synchronize do
          #{f2}(*args)
        end
      end
    ")
  end
end
