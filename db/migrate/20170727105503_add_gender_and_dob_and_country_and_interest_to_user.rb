class AddGenderAndDobAndCountryAndInterestToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :gender, :string
    add_column :users, :dob, :date
    add_column :users, :country, :string
    add_column :users, :interest, :text
  end
end
