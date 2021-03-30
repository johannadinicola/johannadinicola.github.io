# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'johannadinicola.github.io'
  s.version = '0.0.1'
  s.license = 'AGPL-3.0-only'
  s.authors = ['Johanna DiNicola', 'Mike DiNicola']
  s.email = ['johannadinicola@gmail.com']
  s.homepage = 'https://johannadinicola.github.io'
  s.summary = 'Johanna\'s homepage'
  s.required_ruby_version = '~> 2.4'

  s.files = `git ls-files -z`.split("\x0").select do |f|
    f.match(%r{^((_includes|_layouts|_sass|assets)/|(LICENSE|README)((\.(txt|md|markdown)|$)))}i)
  end

  s.platform = Gem::Platform::RUBY
  s.add_runtime_dependency 'jekyll', '= 3.9.0'
  s.add_runtime_dependency 'jekyll-coffeescript', '= 1.1.1'
  s.add_runtime_dependency 'jekyll-commonmark-ghpages', '= 0.1.6'
  s.add_runtime_dependency 'jekyll-default-layout', '= 0.1.4'
  s.add_runtime_dependency 'jekyll-feed', '= 0.15.1'
  s.add_runtime_dependency 'jekyll-gist', '= 1.5.0'
  s.add_runtime_dependency 'jekyll-github-metadata', '= 2.13.0'
  s.add_runtime_dependency 'jekyll-optional-front-matter', '= 0.3.2'
  s.add_runtime_dependency 'jekyll-paginate', '= 1.1.0'
  s.add_runtime_dependency 'jekyll-readme-index', '= 0.3.0'
  s.add_runtime_dependency 'jekyll-relative-links', '= 0.6.1'
  s.add_runtime_dependency 'jekyll-seo-tag', '= 2.6.1'
  s.add_runtime_dependency 'jekyll-titles-from-headings', '= 0.5.3'
  s.add_runtime_dependency 'kramdown', '= 2.3.1'
  s.add_runtime_dependency 'kramdown-parser-gfm', '= 1.1.0'
  s.add_development_dependency 'html-proofer', '~> 3.0'
  s.add_development_dependency 'rubocop', '~> 1.6.1'
  s.add_development_dependency 'w3c_validators', '~> 1.3'
end
