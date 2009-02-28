module CodeProcessors
  
  CODE_PROCESSORS = [ 'ultraviolet', 'coderay', 'syntax', 'highlight_js' ]
  
  def self.select
    name = Radiant::Config['code.processor']

    case name
    when nil, 'auto'
      names = CODE_PROCESSORS.dup

      begin
        return CodeProcessors.const_get( "#{names.first.to_s.camelize}Processor" ).new unless names.empty?
      rescue Object, Exception  
        raise unless load_related_exception? $!

        names.shift
        retry
      end

      raise "Can't load any code processors"
    else
      CodeProcessors.const_get( "#{name.to_s.classify}Processor" ).new
    end
  end

  private
 
  def self.load_related_exception?(e) #:nodoc: implementation specific
    case
    when e.kind_of?(LoadError), e.kind_of?(MissingSourceFile), e.class.name == "CompilationError"
      # We can't rescue CompilationError directly, as it is part of the RubyInline library.
      # We must instead rescue RuntimeError, and check the class' name.
      true
    else
      false
    end
  end

end 
