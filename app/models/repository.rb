# Repository
class Repository < ActiveRecord::Base
  has_many :contributions
  has_many :contributors, through: :contributions, source: :person

  def sync
    github_repo = Octokit.repository name
    self.infos = github_repo.to_hash
    save!
    Octokit.paginate(github_repo.rels[:contributors].href) do |_datas, contributors|
      contributors.data.each do |contributor|
        person = Person.find_or_create_by username: contributor[:login]
        contribution = Contribution.find_or_create_by(
          person: person,
          repository: self
        )
        contribution.infos = contributor.to_hash
        contribution.save!
      end
    end
  end
end
