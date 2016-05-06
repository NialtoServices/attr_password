describe AttrPassword do
  describe '::VERSION' do
    include AttrPassword::RSpec::Matchers::Version

    subject { AttrPassword::VERSION }

    it 'should be semantic' do
      expect(subject).to be_semantic_version
    end
  end
end
