class CompletedSource < ActiveRecord::Base
  belongs_to :user
  belongs_to :source
end
