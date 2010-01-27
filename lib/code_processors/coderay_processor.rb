require 'coderay'

class CodeProcessors::CoderayProcessor < CodeProcessors::Base
  
  # Highlight code using CodeRay
  # Options:
  # * <tt>:lang</tt> - Code language
  # * <tt>:lines</tt> - Line numbering (table/inline/false)
  def highlight( code, options = {} )
    options.symbolize_keys!

    CodeRay.scan( code, options[:lang] || language ).div( :line_numbers => options[:lines].to_sym, :css => :style, :style => theme )
  end
 
  protected

  def default_theme
    'cycnus'
  end

end
