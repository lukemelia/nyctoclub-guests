class Guest < ApplicationRecord
  belongs_to :linkedin_profile, foreign_key: 'linkedin_url', optional: true

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def headline
    lip_headline = linkedin_profile.try(:headline)
    if lip_headline.present? && lip_headline.downcase.include?(company.downcase)
      lip_headline
    else
      "#{lip_headline} (#{company})"
    end
  end

  def num_times_attended
    self.class.where(first_name: first_name, last_name: last_name, attended: true).count
  end
end
