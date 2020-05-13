# README
<h2>database:</h2>

User
  first_name
  last_name
  email
  unit_id
Unit
  name
users_groups
Group
  leader_id -> user_id
  restaurant_id
  event_id
Restaurant
  name
  address
Event
  name
  status - open in_progress done
events_users

<h2>how it should work:</h2>
<pre>
1) new event by cron
2) send email to User.all
3) user click on link and accept event -> create events_users row
4) in cron job gett all open events after "accept_deadline"
4.1) get event users
4.2) group users(build new groups)
4.3) find random leader inside each group(set Group leader_id)
4.4) send email to leader and ask to choose restaurant
5) if user go to email link he will see the page with restaurants where he can choose one
  if he choose
  5.1) we set restaurant_id to group
  5.2) send emails to all group users about group and restaurant
  if he doesn't choose after some "choose_deadline"
  5.3) restaurant_id will be choosen automatically
  5.4) send emails to users about groups and restaurant
</pre>
