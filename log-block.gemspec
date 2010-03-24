# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{log-block}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jon Moses"]
  s.date = %q{2009-03-27}
  s.email = %q{jon@burningbush.us}
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["VERSION.yml", "README.rdoc", "lib/log_block.rb", "test/test_helper.rb", "test/log_block_test.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jmoses/log-block}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Automatic indenting of ruby log messages}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
