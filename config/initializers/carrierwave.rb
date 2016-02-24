CarrierWave.configure do |config|
  if Rails.env.test?
    config.cache_dir = "#{Rails.root}/public/uploads/test/tmp"
  end
end
