require 'coderay'

class CodeProcessors::CoderayProcessor
  
  # Highlight code using CodeRay
  # Options:
  # * <tt>:lang</tt> - Code language
  # * <tt>:lines</tt> - Line numbering (table/inline/false)
  def highlight( code, options = {} )
    options.symbolize_keys!

    CodeRay.scan( code, options[:lang] || 'ruby' ).div( :line_numbers => options[:lines], :css => :style, :style => :cycnus )
  end

end
