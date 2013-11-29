# encoding: utf-8

class IconUploader < CarrierWave::Uploader::Base
  include ::CarrierWave::Backgrounder::Delay

  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
   'thumb_default.png'
  end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb, from_version: :original do
    process resize_to_limit: [50, 50]
  end

  version :portrait, from_version: :original do
    process resize_to_limit: [200, 120]
  end

  version :large, from_version: :original do
    process resize_to_limit: [400, 400]
  end

  version :original do
    process resize_to_limit: [800, 800]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.

  # If you do recreate_versions! this method will encode the filename of the previously encoded name, 
  #   which will result in a new name.  
  # The new name will not be stored in the database!
  # In order to save the newly generated filename you have to call save! on the model after recreate_versions!.

  def filename
     "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected
    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end
end
  