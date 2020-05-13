class BuildGroupsJob < ApplicationJob
  ACCEPT_DEADLINE_LIMIT = 4.days

  queue_as :new_groups

  def perform
    Event.where(status: 'open').where("created_at < ?", Time.now - ACCEPT_DEADLINE_LIMIT).each do |event|
      groups_builder = Groups::Builder.new(event_id)

      groups_builder.build_groups

      if !groups_builder.success?
        Rails.logger.Error("Cannot build froups for event #{event.id}, error: #{groups_builder.error}")
      end
    end
  end
end
