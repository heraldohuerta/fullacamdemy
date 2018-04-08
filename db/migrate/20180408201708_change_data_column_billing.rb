class ChangeDataColumnBilling < ActiveRecord::Migration[5.1]
  def change
     change_table :billings do |t|
       t.change :amount, :decimal, precision: 10, scale: 2
     end
 end

end
