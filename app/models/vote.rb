class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

after_save :update_post

def up_vote?
  value == 1
end

def down_vote?
  value == -1
end

private

def update_post
  post.update_rank
end



end
