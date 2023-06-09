require 'rails_helper'

RSpec.describe User, type: :model 
  before :each do    
    @user = User.create(name: 'Kodjo', photo: 'kodjo.jpg', bio: 'Software Engineer', posts_counter: 2)
  end

  it 'it should set and validate the name provided' do
    name = @user.name 
    expect(name).be eq 'Kodjo'
  end

  it 'should set the photo provided' do 
    photo = @user.photo 
    exepect(photo).to eq 'kodjo.jpg'
  end

  it 'should set the bio provided' do 
    bio = @user.bio 
    exepect(bio).to eq 'Software Engineer'
  end

  it 'should set the post counter provided' do 
    posts_counter = @user.posts_counter 
    exepect(posts_counter).to eq 2
  end
end
