class CodeProcessors::Base

  # Highlight code
  def highlight( code, options = {} )
    options.symbolize_keys!

    "<code class=\"#{options[:lang] || 'ruby'}\">#{CGI.escapeHTML(code)}</code>"
  end

  # Include required scripts
  def include_scripts
    ''
  end

  # Include required stylesheets
  def include_stylesheets
    ''
  end

end 
