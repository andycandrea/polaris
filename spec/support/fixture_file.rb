module FixtureFile
  def fixture_file(filename)
    File.expand_path("../../fixtures/files/#{filename}", __FILE__)
  end

  def mock_fixture_file_upload(filename)
    ActionDispatch::Http::UploadedFile.new(
      tempfile: File.open(fixture_file(filename)),
      filename: filename
    )
  end

  def open_fixture_file(filename) # for Carrierwave-handled files
    File.open(File.join(Rails.root, "/spec/fixtures/files/#{filename}"))
  end
end

RSpec.configure do |config|
  config.include FixtureFile
end
