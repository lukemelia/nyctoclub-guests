task :import => :environment do
  require 'csv'

  csv_text = File.read('/Users/lmelia/Downloads/Guests.csv')
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    next if row["First Name"].blank? && row["Last Name"].blank?
    hash = row.to_hash
    hash.keys.each do |key|
      if key == 'Date'
        hash[:year] = hash['Date'].split(/-/)[0]
        hash[:month] = hash['Date'].split(/-/)[1]
        hash.delete(key)
        next
      end
      new_key = key.underscore.gsub(' ', '_')
        .gsub('date', 'month')
        .gsub('bio_url', 'linkedin_url')
        .gsub(/\?$/, '')
        .to_sym
      hash[new_key] = hash[key] unless new_key == :linked_name
      hash.delete(key)
    end
    Guest.create!(hash)
  end
end
