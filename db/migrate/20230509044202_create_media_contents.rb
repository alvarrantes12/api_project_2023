class CreateMediaContents < ActiveRecord::Migration[7.0]
  def change
    create_table :media_contents do |t|
      t.string :name
      t.belongs_to :director

      t.timestamps
    end
  end
end

