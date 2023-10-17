# frozen_string_literal: true

class AddSessionTypeToSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :sessions, :session_type, :string, null: false, default: SessionTypes::MORNING
  end
end
