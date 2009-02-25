require 'coderay'

module CodeTags
  include Radiant::Taggable

  tag 'code' do |tag|
    CodeRay.scan( tag.expand, "ruby" ).div( :line_numbers => :table, :css => :style, :style => :cycnus )
  end

end