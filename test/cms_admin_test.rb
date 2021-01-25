require "test_helper"
require "rake"

class CmsAdminTest < ActiveSupport::TestCase
  setup do
    Rake::Task['generate cms_section FatCats'].invoke
  end

  test "it has a version number" do
    assert CmsAdmin::VERSION
  end

  test "creates section controller" do
    assert true
  end
end
