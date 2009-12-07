require 'uv'

class CodeProcessors::UltravioletProcessor < CodeProcessors::Base
  
  # Highlight code using Syntax gem
  # Options:
  # * <tt>:lang</tt> - Code language
  # * <tt>:lines</tt> - Line numbering (table/inline/false)
  def highlight( code, options = {} )
    options.symbolize_keys!

    Uv.parse( code, 'xhtml', ( options[:lang] || language ), !!options[:lines], theme )
  end

  def include_stylesheets
    '<link rel="stylesheet" type="text/css" href="http://ultraviolet.rubyforge.org/css/' + theme + '.css" />'
  end

  protected

  def default_theme
    'active4d'
  end

end
