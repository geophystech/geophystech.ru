# frozen_string_literal: true

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = 'last 2 versions'
end

activate :directory_indexes
activate :livereload
activate :sprockets

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml',  layout: false
page '/*.json', layout: false
page '/*.txt',  layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def navbar_link(text, url)
    current = current_page.url.split('/').reject(&:empty?).first
    target  = url.split('/').reject(&:empty?).first

    link_to text, url, class: ('active-link' if current == target)
  end

  def link_to_read_more(text, url)
    path = content_tag(:path, nil, d: 'M7.5 8l-5 5L1 11.5 4.75 8 1 4.5 2.5 3z', fill: { rule: 'evenodd' })
    svg = content_tag(:svg, path, aria: { hidden: 'true' }, height: '14', version: '1.1', viewbox: '0 0 6 13', width: '12', class: 'svg-arrow')

    link_to text + svg, url
  end
end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :minify_html
  activate :relative_assets
end

# Disable warnings
Haml::TempleEngine.disable_option_validator!


module AssetHelper
  ##
  # Renders a stylesheet asset inline.
  def inline_stylesheet(name)
    content_tag :style do
      sprockets["#{name}.css"].to_s
    end
  end

  ##
  # Renders a javascript asset inline.
  def inline_javascript(name)
    content_tag :script do
      sprockets["#{name}.js"].to_s
    end
  end
end

helpers AssetHelper
