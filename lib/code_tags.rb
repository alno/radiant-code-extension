require 'coderay'

module CodeTags
  include Radiant::Taggable

  desc %{
    Highlights an code.

    *Usage*:
    <pre><code><r:code lang="ruby" lines="table">...</r:code></pre></code>
  }
  tag 'code' do |tag|
    CodeRay.scan( tag.expand, tag.attr['lang'] || 'ruby' ).div( :line_numbers => tag.attr['lines'], :css => :style, :style => :cycnus )
  end

end