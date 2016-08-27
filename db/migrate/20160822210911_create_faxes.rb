class CreateFaxes < ActiveRecord::Migration[5.0]
  def change
    create_table :faxes do |t|
      t.string :fax_number
      t.integer :fax_type_id
      t.integer :extend_demography_id
      t.text :note

      t.timestamps
    end
  end
end
