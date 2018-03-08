class RemoveCompanyIdFromUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :company_id, :bigint
  end
end
