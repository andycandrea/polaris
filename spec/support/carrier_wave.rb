# Store uploads in separate directory and clear them out at the end of running
# the entire suite
carrier_wave_test_root = "#{Rails.root}/tmp/test_public"
CarrierWave.configure do |config|
  config.root = -> { carrier_wave_test_root }
  config.enable_processing = false
end

RSpec.configure do |config|
  config.after(:suite) do
    FileUtils.rm_rf(carrier_wave_test_root)
  end
end
