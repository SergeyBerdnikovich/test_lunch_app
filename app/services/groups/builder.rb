class Groups::Builder
  MAX_GROUP_USERS_AMOUNT = 5

  attr_reader :event_id

  def initialize(event_id)
    @event_id = event_id
  end

  def build_groups
    event = Event.where(status: 'open').find(event_id)
    event.update(status: 'in_progress')

    users_amount  = event.users.count
    groups_amount = (users_amount / MAX_GROUP_USERS_AMOUNT).ceil

    groups = Array.new(groups_amount, Group.create!(event_id: event_id))

    current_group_index = 0
    event.users.group_by(&:unit_id).each do |_, users|
      users.shuffle.each do |user|
        groups[current_group_index].users << user

        current_group_index += 1
        if current_group_index == groups_amount
          current_group_index = 0
        end
      end
    end

    leaders_ids = find_leaders(groups)

    send_choose_restaurant_emails(leaders_ids)
  rescue => e
    @error = "Some error during group buildings, error: #{e.error_message}"
  end

  private

  def find_leaders(groups)
    groups.map do |group|
      leader_id = User.find(group.users.pluck(:id).shuffle.first)
      group.update(leader_id: leader_id)

      leader_id
    end
  end

  def send_choose_restaurant_emails(leaders_ids)
    # send email with link to page of choosing restaurant
  end
end
