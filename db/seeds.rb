DATA = {
  :customer_keys => 
    ["name", "nausea", "happiness", "tickets", "height"],
  :customers => [
    ["Max Charles", 0, 3, 6, 32],
    ["Skai Jackson", 1, 3, 10, 60],
    ["Kaleo Elam", 1, 2, 15, 59],
    ["Megan Charpentier", 3, 1, 12, 60],
    ["Hayden Byerly", 1, 1, 16, 58],
    ["Tenzing Norgay Trainor", 0, 1, 10, 55],
    ["Davis Cleveland", 1, 3, 5, 36],
    ["Cole Sand", 2, 2, 7, 34],
    ["Quvenzhané Wallis", 2, 2, 13, 30]
  ],
  :attraction_keys =>
   ["name", "nausea_rating", "happiness_rating", "tickets", "min_height"],
  :attractions => [
    ["Scrambler Ride", 2, 2, 2, 36],
    ["Miniature Railroad", 0, 1, 2, 32],
    ["Merry-Go-Round", 1, 1, 1, 30],
    ["Roller Coaster", 1, 3, 4, 54],
    ["Swinging Ship", 2, 2, 2, 36],
    ["Go Karts", 1, 2, 3, 36],
    ["Haunted Mansion", 1, 1, 1, 30],
    ["Ferris Wheel", 1, 1, 2, 36],
    ["Teacups Ride", 3, 1, 1, 28]
  ],
  :owners => [
    "Mary Elitch Long",
    "John Elitch"
  ]
}

def main
  make_customers
  make_owners
  make_attractions_and_rides
end

def make_customers
  DATA[:customers].each do |customer|
    new_customer = Customer.new
    customer.each_with_index do |attribute, i|
      new_customer.send(DATA[:customer_keys][i]+"=", attribute)
    end
    new_customer.save
  end
end

def make_owners
  DATA[:owners].each do |name|
    Owner.create(:name => name)
  end
end

def make_attractions_and_rides
  DATA[:attractions].each do |attraction|
    new_attraction = Attraction.new
    attraction.each_with_index do |attribute, i|
      new_attraction.send(DATA[:attraction_keys][i] + "=", attribute)
    end
    rand(1..8).times do 
      new_attraction.customers << Customer.find_by(:id => rand(1..8))
    end
    new_attraction.customers.each {|c| c.save}
    new_attraction.save
  end
end

main