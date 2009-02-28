class CodeProcessors::HighlightJsProcessor < CodeProcessors::Base
  
  # Highlight code using highlight.js javascript library
  # Options:
  # * <tt>:lang</tt> - Code language
  # * <tt>:lines</tt> - Line numbering (table/inline/false)
  def highlight( code, options = {} )
    options.symbolize_keys!

    "<pre><code class=\"#{options[:lang] || language}\">#{CGI.escapeHTML(code)}</code></pre>"
  end

  # Include required javascripts
  def include_javascripts
    '<script src="http://softwaremaniacs.org/media/soft/highlight/highlight.pack.js"></script><script type="text/javascript">hljs.tabReplace = \'    \';hljs.initHighlightingOnLoad();</script>'
  end

  # Include required stylesheets
  def include_stylesheets
    '<link rel="stylesheet" title="highlight.js theme" href="http://softwaremaniacs.org/media/soft/highlight/styles/' + theme + '.css" />'
  end
 
  protected

  def default_theme
    'idea'
  end

end
