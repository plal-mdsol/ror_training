require "rails_helper"

# study should have a name 
describe Study, type: :model do
    
    context 'when study do not have a name' do
        it 'is invalid' do
            study = Study.new(name: '')
            expect(study.valid?).to eq false
        end
    end

    context "when study have a name" do 
        it "is valid" do 
            study = Study.new(name: 'my_study', age_limit: 10, drug: 'abcd', phase: 4)

            expect(study.valid?).to eq true
        end
    end

    context 'it validates drug' do
        it { is_expected.to validate_presence_of(:drug) }
    end

    context 'it validates age_limit:' do
        study = Study.create(age_limit: 6)
        it { expect(study).to validate_numericality_of(:age_limit).is_greater_than(7)}
    end
    context 'it validates phase' do
        study = Study.create(phase: 6)
        it { expect(study).to validate_numericality_of(:phase).is_less_than_or_equal_to(5)}
    end

end