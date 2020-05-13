class LunchController < ApplicationController
  def accept_event
    # ToDo: add some token checking

    events_scheduler.add_user_to_event(accept_event_params[:user_id])
    if events_scheduler.success?
      flash[:notice] = 'You have accepted the event'
    else
      flash[:notice] = "You have not accepted the event, error: #{events_scheduler.error}"
    end
  end

  private

  def accept_event_params
    params.permit(:user_id, :event_id)
  end

  def events_scheduler
    @events_scheduler ||= Events::Scheduler.new(accept_event_params[:event_id])
  end
end
