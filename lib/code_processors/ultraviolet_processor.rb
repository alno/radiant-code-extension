require 'uv'

class CodeProcessors::UltravioletProcessor < CodeProcessors::Base
  
  # Highlight code using Syntax gem
  # Options:
  # * <tt>:lang</tt> - Code language
  # * <tt>:lines</tt> - Line numbering (table/inline/false)
  def highlight( code, options = {} )
    options.symbolize_keys!

    Uv.parse( code, 'xhtml', ( options[:lang] || 'ruby' ), options.key?( :lines ), 'amy' )
  end

end
