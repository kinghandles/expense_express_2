require 'rails_helper'

RSpec.describe Category, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:expenses) }

    end

    describe "InDirect Associations" do

    it { should have_many(:groups) }

    end

    describe "Validations" do
      
    end
end
