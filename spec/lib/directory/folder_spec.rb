require 'spec_helper'

module Directory
  RSpec.describe Folder do
    let(:root) do
      Directory::Folder.new('root')
        .add(Directory::File.new('readme.md', '#Readme'))
        .add(Directory::File.new('CHANGELOG.md', '#Changelog of gem'))
        .add(Directory::File.new('CONTRIBUTORS.md', '#How to contribute in this project'))
        .add(Directory::Folder.new('src')
          .add(Directory::File.new('main.rb', 'def hello_world; puts "hola"; end'))
          .add(Directory::File.new('spec.rb', 'def hello_world_spec; puts "hello"; end')))
    end

    describe '#list' do
      it 'returns the list' do
        expect(root.list).to include(
          'root (Folder)',
          'root/readme.md (56 Bytes)',
          'root/CHANGELOG.md (136 Bytes)',
          'root/CONTRIBUTORS.md (272 Bytes)',
          'root/src (Folder)',
          'root/src/main.rb (264 Bytes)',
          'root/src/spec.rb (312 Bytes)'
        )
      end
    end

    describe '#logical_size' do
      it 'returns the folder size' do
        expect(root.logical_size).to eq(1040)
      end
    end

    describe '#cat' do
      it 'raises an error' do
        expect { root.cat }.to raise_error('root is a folder.')
      end
    end

    describe '#edit' do
      it 'raises an error' do
        expect { root.edit("text") }.to raise_error('root is a folder.')
      end
    end
  end
end
