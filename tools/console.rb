require_relative '../config/environment.rb'
require 'pry'

def reload
  load 'config/environment.rb'
end

paul = Driver.new("Paul")
shannon = Driver.new("Shannon")
matteo = Passenger.new("Matteo")
nick = Passenger.new("Nick")
anney = Passenger.new("Anney")
james = Passenger.new("James")

Ride.new(paul, matteo, 6)
Ride.new(paul, matteo, 20)
Ride.new(paul, nick, 20)
Ride.new(shannon, matteo, 13)
Ride.new(shannon, anney, 3)
Ride.new(shannon, anney, 35)
Ride.new(shannon, anney, 67)
Ride.new(shannon, james, 101)

binding.pry
0
