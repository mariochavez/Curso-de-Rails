class AgregarColumnaDePublishedAJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :published, :boolean
  end

  def self.down
    remove_column :jobs, :published
  end
end
