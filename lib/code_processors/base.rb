# Base class for code processors
# Basic operations:
# * <tt>highlight</tt> - highlight a block of code
# * <tt>include_javascripts</tt> - include required javascripts
# * <tt>include_stylesheets</tt> - include required stylesheets
class CodeProcessors::Base

  # Highlight code
  def highlight( code, options = {} )
    options.symbolize_keys!

    "<code class=\"#{options[:lang] || language}\">#{CGI.escapeHTML(code)}</code>"
  end

  # Include required scripts
  def include_javascripts
    ''
  end

  # Include required stylesheets
  def include_stylesheets
    ''
  end

  # Theme using in highlighting
  def theme
    @theme ||= Radiant::Config['code.theme'] || default_theme
  end

  # Default code language
  def language
    @language ||= Radiant::Config['code.language'] || default_language
  end

  protected

  def default_theme
    'default'
  end

  def default_language
    'ruby'
  end

  def tag( name, options = {} )
    name = name.to_s

    str = '<'
    str << name

    options.each do |k,v|
      str << ' '
      str << k.to_s
      str << '="'
      str << v.to_s
      str << '"'
    end

    str << '>'
    str << yield
    str << '</'
    str << name
    str << '>'
    str
  end

end 
