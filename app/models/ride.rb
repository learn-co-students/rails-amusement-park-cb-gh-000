class Ride < ActiveRecord::Base
  belongs_to :customer
  belongs_to :attraction

  def start_ride
    if self.customer.tickets >= self.attraction.tickets
      new_happiness = self.customer.happiness + self.attraction.happiness_rating
      new_nausea = self.customer.nausea + self.attraction.nausea_rating
      new_tickets =  self.customer.tickets - self.attraction.tickets
      self.customer.update(
        :happiness => new_happiness,
        :nausea => new_nausea,
        :tickets => new_tickets
      )
      "Thanks for riding the #{self.attraction.name}!"
    else
      "Sorry, you do not have enough tickets the #{self.attraction.name}."
    end
  end
end
