class CreateJoinTableRecepientsReceivedMessages < ActiveRecord::Migration[5.2]
  def change
    create_join_table :recipients, :r_messages do |t|
      t.index [:recipients_id, :r_messages_id]
      t.index [:r_messages_id, :recipients_id]
    end
  end
end
