
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "a3rt_client/version"

Gem::Specification.new do |spec|
  spec.name          = "a3rt_client"
  spec.version       = A3rtClient::VERSION
  spec.authors       = ["ken yamamoto(山本　憲)"]
  spec.email         = ["em072029@gmail.com"]

  spec.summary       = %q{this gem is the wrapper for A3RT API}
  spec.description   = %q{this gem is the api wrapper for A3RT url: https://a3rt.recruit-tech.co.jp/}
  spec.homepage      = "https://github.com/yk0817/a3rt_client"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  gem.add_runtime_dependency "faraday"
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
