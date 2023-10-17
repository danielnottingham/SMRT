# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions, id: :uuid do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.references :track, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
