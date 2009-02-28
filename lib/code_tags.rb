module CodeTags
  include Radiant::Taggable

  desc %{
    Highlights an code.

    *Usage*:
    <pre><code><r:code lang="ruby" lines="table">...</r:code></pre></code>
  }
  tag 'code' do |tag|
    code_processor.highlight( tag.expand, :lang => tag.attr['lang'], :lines => tag.attr['lines'] )
  end

  private

  def code_processor
    @@code_processor ||= CodeProcessors.select
  end

end