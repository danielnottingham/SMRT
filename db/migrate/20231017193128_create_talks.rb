# frozen_string_literal: true

class CreateTalks < ActiveRecord::Migration[7.1]
  def change
    create_table :talks, id: :uuid do |t|
      t.string :title, null: false
      t.integer :duration, null: false
      t.boolean :lightning_talk, null: false, default: false
      t.references :session, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
