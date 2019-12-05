require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:individual_expense_ledgers) }

    end

    describe "InDirect Associations" do

    it { should have_many(:expenses) }

    end

    describe "Validations" do
      
    end
end
