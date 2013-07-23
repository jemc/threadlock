require 'monitor'

def threadlock(*funcs, lock: :@___threadlock___)
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
          .gsub(/\%/, "_mOD")
          .gsub(/\[/, "_bRACKO")
          .gsub(/\]/, "_bRACKC")
          .gsub(/\@/, "_aTTR")
          .gsub(/\&/, "_aMPER")
          .gsub(/\|/, "_pIPE")
          .gsub(/\^/, "_cARET")
          .gsub(/^/, "___")
    
    class_eval\
    ("
      alias :#{f2} :#{f}
      def #{f}(*args, &block)
        #{lock.to_s} ||= Monitor.new
        #{lock.to_s}.synchronize do
          #{f2}(*args, &block)
        end
      end
    ")
  end
end
