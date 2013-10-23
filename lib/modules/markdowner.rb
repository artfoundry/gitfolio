require 'bluecloth'

module Markdowner

  extend self

  def markdown_convert(html_text)
    BlueCloth.new(html_text).to_html
  end

end


test_input = "A First Level Header
====================

A Second Level Header
---------------------"

expected_output = "<h1>A First Level Header</h1>\n\n<h2>A Second Level Header</h2>"

p Markdowner.markdown_convert(test_input) == expected_output


