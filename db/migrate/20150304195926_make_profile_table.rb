class MakeProfileTable < ActiveRecord::Migration
  def change
    create_table :profiles do |t|

      t.column :username, :string
      t.column :avatar_url, :string
      t.column :location, :string
      t.column :company, :string
      t.column :number_of_followers, :integer
      t.column :number_following, :integer
      t.column :repository_list, :blob
      t.column :body, :text

      t.timestamps null: :false
    end
  end
end
