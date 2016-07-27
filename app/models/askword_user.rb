class AskwordUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :askword
end
