require 'test_helper'

class DownloadTest < ActiveSupport::TestCase
  should belong_to(:empresa)
  should belong_to(:documento)

  test "should generate a uniq token before create" do
    download = Download.new
    download.save

    assert download.token.present?
  end

  test "should not be complete when created" do
    download = Download.new
    assert !download.completed?
  end

  test "should be set as complete" do
    download = downloads(:one)
    download.complete!

    assert download.completed?
  end
end
