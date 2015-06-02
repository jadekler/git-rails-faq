class CreateFaqs < ActiveRecord::Migration
  def self.up
    create_table :faq do |t|
      t.string :name
      t.string :faq
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
