require 'rails_helper'

RSpec.describe IndividualExpenseLedger, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:expense) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:expense_id) }

    it { should validate_presence_of(:expense_id) }

    it { should validate_uniqueness_of(:user_id) }

    it { should validate_presence_of(:user_id) }
      
    end
end
