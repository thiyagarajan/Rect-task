require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'is invalid without a developer' do
    expect(build(:project, developer: nil)).not_to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:project, name: ' ')).not_to be_valid
  end

  it 'is invalid without a description' do
    expect(build(:project, description: ' ')).not_to be_valid
  end

  it 'is invalid when name is not unique for developer' do
    developer1 = create(:developer)
    developer2 = create(:developer)

    project = create(:project, developer: developer1)

    expect(
      build(:project, name: project.name, developer: developer1)
    ).not_to be_valid

    expect(
      build(:project, name: project.name, developer: developer2)
    ).to be_valid
  end
end
