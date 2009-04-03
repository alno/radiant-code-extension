module CodeTags
  include Radiant::Taggable

  desc %{
    Highlights an code.

    *Usage*:
    <pre><code><r:code lang="ruby" lines="table">...</r:code></pre></code>
  }
  tag 'code' do |tag|
    code_processor.highlight( tag.expand.sub(/^\n/,''), :lang => tag.attr['lang'], :lines => tag.attr['lines'] )
  end

  desc %{
    Includes required stylesheets for code highlighting.
  }
  tag 'include_code_stylesheets' do |tag|
    code_processor.include_stylesheets
  end

  desc %{
    Includes required javascripts for code highlighting.
  }
  tag 'include_code_javascripts' do |tag|
    code_processor.include_javascripts
  end

  private

  def code_processor
    @@code_processor ||= CodeProcessors.select
  end

end