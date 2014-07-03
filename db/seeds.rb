DATA = {
  :customer_keys => 
    ["name", "nausea", "happiness", "tickets", "height"],
  :customers => [
    ["Mindy Kaling", 0, 3, 6, 32],
    ["Amy Poehler", 1, 3, 10, 60],
    ["Tina Fey", 1, 2, 15, 59],
    ["David Sedaris", 3, 1, 12, 60],
    ["Allison Silverman", 1, 1, 16, 58],
    ["Ricky Gervais", 0, 1, 10, 55],
    ["Dave Barry", 1, 3, 5, 36],
    ["Adam McKay", 2, 2, 7, 34]
  ],
  :attraction_keys =>
   ["name", "nausea_rating", "happiness_rating", "tickets", "min_height"],
  :attractions => [
    ["Scrambler", 2, 2, 2, 36],
    ["Miniature Railroad", 0, 1, 2, 32],
    ["Merry-Go-Round", 1, 1, 1, 30],
    ["Wooden Roller Coaster", 1, 3, 4, 54],
    ["Swinging Ship", 2, 2, 2, 36],
    ["Go Karts", 1, 2, 3, 36],
    ["Haunted House", 0, 1, 1, 30],
    ["Ferris Wheel", 1, 1, 2, 36]
  ]
}

def main
  make_customers
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