# Person
class Person < ActiveRecord::Base
  has_many :contributions
  has_many :repository, through: :contributions
  def sync
    github_user = Octokit.user username
    self.infos = github_user.to_hash
    save!
  end

  before_save do
    self.location = infos.try(:[], 'location')
    self.company = infos.try(:[], 'company')
  end

  def self.sync_all
    where('infos IS NULL').find_each do |person|
      begin
        puts person.username
        person.sync
      rescue
        puts 'OOPS'
      end
    end
  end
end
