# encoding: utf-8

require_relative '../../app/processors/import_file_processor'

describe ImportFileProcessor do
  let(:file) { File.open('./spec/fixtures/example_input.tab') }
  let(:processor) { ImportFileProcessor.new(file) }

  describe '#run' do
    it 'should delegate to an instance of processor' do
      processor = double(:processor, run!: true)
      ImportFileProcessor.should_receive(:new)
      .with(file)
      .and_return(processor)

      ImportFileProcessor.run(file)
    end
  end

  describe '.run' do
    let(:results) { [{ a: 1 }, { b: 2 }] }

    it 'should read file and create records' do
      parser = double(:parser)
      parser.should_receive(:process).with(file).and_return(parser)
      parser.should_receive(:results).and_return(results)

      model = double(:model)
      model.should_receive(:create!).with(results, :transaction)

      processor.should_receive(:calculate_key_for_file)
               .and_return(:transaction)

      processor.run!(parser, model)
    end
  end

  describe '.calculate_key_for_file' do
    subject { processor }

    its(:calculate_key_for_file) do
      should eql('fba43c164b2ede057bb26c51740921bb')
    end
  end
end
