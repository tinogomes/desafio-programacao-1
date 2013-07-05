# encoding: utf-8

require_relative '../../app/processors/import_file_processor'

describe ImportFileProcessor do
  let(:file) { File.open('./spec/fixtures/example_input.tab') }

  describe '#run' do
    it 'should delegate to an instance of processor' do
      processor = double(:processor, run: true)
      ImportFileProcessor.should_receive(:new)
      .with(file)
      .and_return(processor)

      ImportFileProcessor.run(file)
    end
  end

  describe '.run' do
    let(:processor) { ImportFileProcessor.new(file) }
    let(:results)   { [{ a: 1 }, { b: 2 }] }

    it 'should read file and create records' do
      parser = double(:parser)
      parser.should_receive(:process).with(file).and_return(parser)
      parser.should_receive(:results).and_return(results)

      model = double(:model)
      model.should_receive(:create!).twice

      processor.run(parser, model)
    end
  end
end
