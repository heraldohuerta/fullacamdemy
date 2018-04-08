class ChangeDataColumnOrders < ActiveRecord::Migration[5.1]
  def change
     change_table :orders do |t|
       t.change :total, :decimal, precision: 10, scale: 2
     end
 end
end
