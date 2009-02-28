require 'syntax/convertors/html'

class CodeProcessors::SyntaxProcessor < CodeProcessors::Base
  
  # Highlight code using Syntax gem
  # Options:
  # * <tt>:lang</tt> - Code language
  # * <tt>:lines</tt> - Line numbering (table/inline/false)
  def highlight( code, options = {} )
    options.symbolize_keys!

    Syntax::Convertors::HTML.for_syntax( options[:lang] || language ).convert( code )
  end

end

