require 'rails_helper'

RSpec.describe Developer, type: :model do
  it 'is invalid with blank first name' do
    expect(build(:developer, first_name: ' ')).not_to be_valid
  end

  it 'is invalid with blank last name' do
    expect(build(:developer, last_name: ' ')).not_to be_valid
  end

  describe 'projects' do
    before do
      @developer = create(:developer)
      5.times { create(:project, developer: @developer) }
    end

    it 'can have many projects' do
      expect(@developer.projects.count).to eq 5
    end

    it 'deletes projects after developer is destroyed' do
      expect { @developer.destroy }.to change(Project, :count).by(-5)
    end
  end
end
