# Contribution
class Contribution < ActiveRecord::Base
  belongs_to :repository
  belongs_to :person

  before_save do
    if infos['contributions']
      self.contribution = infos['contributions']
    end
  end

end
