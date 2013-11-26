class CreateStartups < ActiveRecord::Migration
  def change
    create_table :startups do |t|
      t.string :name
      t.text :short_description
      t.string :details_url
      t.string :homepage_url
      t.string :blog_url
      t.string :blog_feed_url
      t.string :twitter_username
      t.integer :number_of_employees
      t.string :linkedin_url
      t.date :founding_date
      t.string :country
      t.string :city
      t.string :state
      t.string :category
      t.string :phone
      t.string :email

      t.timestamps
    end
    add_index :startups, :name, :unique => true
    add_index :startups, :homepage_url, :unique => true
    add_index :startups, :blog_url, :unique => true
    add_index :startups, :blog_feed_url, :unique => true
    add_index :startups, :twitter_username, :unique => true
    add_index :startups, :linkedin_url, :unique => true
    add_index :startups, :email, :unique => true
  end
end
