require 'rails_helper'

RSpec.describe Expense, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:category) }

    it { should belong_to(:group) }

    it { should have_many(:individual_expense_ledgers) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_uniqueness_of(:group_id) }

    it { should validate_presence_of(:group_id) }
      
    end
end
