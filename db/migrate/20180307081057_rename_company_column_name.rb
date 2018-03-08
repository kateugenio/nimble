class RenameCompanyColumnName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :company, :company_name
  end
end
