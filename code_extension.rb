class CodeExtension < Radiant::Extension
  version "1.0"
  description "Extension to highlight code"
  url "https://github.com/alno/radiant-code-extension/"
  
  def activate
    Page.send :include, CodeTags
  end
  
  def deactivate
  end
  
end
