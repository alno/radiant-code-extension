class CodeProcessors::Base

  # Highlight code
  def highlight( code, options = {} )
    options.symbolize_keys!

    "<code class=\"#{options[:lang] || 'ruby'}\">#{CGI.escapeHTML(code)}</code>"
  end

  # Include required scripts
  def include_javascripts
    ''
  end

  # Include required stylesheets
  def include_stylesheets
    ''
  end

  def theme
    @theme ||= Radiant::Config['code.theme'] || default_theme
  end

  protected

  def default_theme
    'default'
  end

end 
