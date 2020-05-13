class Events::Scheduler
  attr_reader :event_id
  attr_reader :error

  def initialize(event_id)
    @event_id = event_id
    @error    = nil
  end

  def success?
    error.blank?
  end

  def add_user_to_event(user_id)
    event = Event.where(status: 'open').find(event_id)
    user  = User.find(user_id)

    event.users << user
  rescue => e
    @error = "Some issue: #{e.error_message}"
  end
end
