class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    tickets_issue = " You do not have enough tickets to ride the #{attraction.name}."
    height_issue = " You are not tall enough to ride the #{attraction.name}."
    enough_tickets, enough_height = meet_requirements
    if enough_tickets && enough_height
      start_ride
    elsif !enough_tickets && enough_height
      'Sorry.' + tickets_issue
    elsif enough_tickets && !enough_height
      'Sorry.' + height_issue
    else
      'Sorry.' + tickets_issue + height_issue
    end
  end

  def start_ride
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
    "Thanks for riding the #{attraction.name}!"
  end

  def meet_requirements
    enough_tickets, enough_height = false
    enough_tickets = true if user.tickets > attraction.tickets
    enough_height = true if user.height > attraction.min_height
    [enough_tickets, enough_height]
  end
end
