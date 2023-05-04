require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(
      name: 'Anything',
      photo: 'http://licalhost:3000/anything.jpg',
      bio: 'Anything test',
      posts_counter: 0
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'it is not valid with negeative number for post conuter' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
  it 'it is not valid with string for post conuter' do
    subject.posts_counter = 'string'
    expect(subject).to_not be_valid
  end
end
