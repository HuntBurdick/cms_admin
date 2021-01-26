require_relative "lib/cms_admin/version"

Gem::Specification.new do |spec|
  spec.name        = "cms_admin"
  spec.version     = CmsAdmin::VERSION
  spec.authors     = ["Hunt Burdick"]
  spec.email       = ["hunt@edealerdirect.com"]
  spec.homepage    = "https://www.websitescenes.com/cms_admin"
  spec.summary     = "A Rails backend for for frontends."
  spec.description = "Provides an admin backend and API for Javascript frontends."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/HuntBurdick/cms_admin"
  spec.metadata["changelog_uri"] = "https://github.com/HuntBurdick/cms_admin/changelog"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.1"
end
