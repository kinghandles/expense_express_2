require 'rails_helper'

RSpec.describe Group, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:expenses) }

    end

    describe "InDirect Associations" do

    it { should have_many(:categories) }

    end

    describe "Validations" do
      
    end
end
