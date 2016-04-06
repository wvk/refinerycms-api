class ResizeApiKeyField < ActiveRecord::Migration
  def change
    unless defined?(User)
      change_column :refinery_users, :api_key, :string, :limit => 48
    end
  end
end