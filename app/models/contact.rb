require 'csv'

class Contact < ApplicationRecord


  private

  def self.load_csv
    CSV.foreach(Rails.root.join('db/contacts.csv'), headers: true) do |row|
      Contact.create(name: row[0], email: row[8], phone: row[11])
    end
  end
end
