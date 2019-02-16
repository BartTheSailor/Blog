class CleanUpOldCommentsJob < ApplicationJob
  queue_as :default

  def perform(*args)

    # Do something later
    destroyed = Comment.where('created_at < ?', 2.weeks.ago).destroy_all
    logger.info "Deleted #{destroyed.size} comments created before #{2.weeks.ago}"
  end
end
