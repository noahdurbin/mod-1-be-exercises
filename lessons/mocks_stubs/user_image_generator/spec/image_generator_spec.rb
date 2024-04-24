require 'rspec'
require './lib/image_generator'

RSpec.describe ImageGenerator do
  describe '#initialize' do
    it 'exists' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator).to be_a ImageGenerator
    end

    it 'has attributes' do
      image_generator = ImageGenerator.new(2500)
      expect(image_generator.max_image_size).to eq 2500
    end

    it 'can generate images' do
      image_generator = ImageGenerator.new(2500)
      allow(image_generator).to receive(:rand).and_return(3)

      expect(image_generator.generate_images).to eq(["image0", "image1", "image2"])
    end

    it 'can change max size' do
      image_generator = ImageGenerator.new(2500)
      allow(image_generator).to receive(:rand).and_return(3)

      expect(image_generator.change_max_size(3)).to eq(9)
    end
    # Using stubs write the tests to confirm the functionality
    # that exists in ./lib/image_generator.rb
  end
end
