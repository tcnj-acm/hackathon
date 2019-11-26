# frozen_string_literal: true

##
# Adds database tables for storing rich text.
class CreateActionTextTables < ActiveRecord::Migration[6.0]
  def change
    create_table :action_text_rich_texts do |t|
      t.string :name, null: false
      t.text :body, size: :long
      t.references :record, null: false, polymorphic: true, index: false

      t.timestamps null: false

      t.index %i[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
    end
  end
end