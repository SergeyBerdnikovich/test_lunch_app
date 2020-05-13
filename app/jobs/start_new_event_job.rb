class StartNewEventJob < ApplicationJob
  queue_as :new_events

  def perform
    Event.create!(name: "New week lunch event: #{Time.now.to_date}", status: 'open')
  end
end
