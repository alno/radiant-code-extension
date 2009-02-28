module CodeProcessors
  
  def self.select
    name = Radiant::Config['code.processor']

    case name
    when nil, 'auto'
      names = CODE_PROCESSORS.dup

      begin
        return CodeProcessors.const_get( "#{names.first.to_s.classify}Processor" ).new unless names.empty?
      rescue Object, Exception        
        names.shift
        retry
      end

      raise "Can't load any code processors"
    else
      CodeProcessors.const_get( "#{name.to_s.classify}Processor" ).new
    end
  end

  CODE_PROCESSORS = [ 'code_ray' ]

end 
