class Passenger

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # matteo.rides --> [PM, PM, SM]
    def rides
        # Ride.all --> [PM, PM, PN, SM, SA, SA, SA, SJ]
        Ride.all.select do |ride|
            # self is matteo
            ride.passenger == self
        end
    end

    # matteo.drivers --> [P, S]
    def drivers
        # matteo.rides --> [PM, PM, SM]
        drivers_with_duplicates = self.rides.map do |ride|
            ride.driver
        end
        # drivers_with_duplicates --> [P, P, S]
        drivers_with_duplicates.uniq # --> [P, S]
    end

    def total_distance
        # matteo.rides --> [PM, PM, SM]
        distances = self.rides.map do |ride|
            ride.distance 
        end
        # distances --> [6, 20, 13]
        distances.sum # --> 39
    end

    # Passenger.premium_members --> self = Passenger
    # Passenger.total_distance --> DOESN'T WORK: total_distance is an instance method

    def self.premium_members
        # Passenger.all --> [M, N, A, J]
        self.all.select do |passenger|
            # anney.total_distance --> 105
            passenger.total_distance > 100
        end
    end

end