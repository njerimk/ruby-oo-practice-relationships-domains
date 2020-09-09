
class Driver

    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # paul.rides --> [PM, PM, PN]
    def rides
        # Ride.all --> [PM, PM, PN, SM, SA, SA, SA, SJ]
        Ride.all.select do |ride|
            # self is paul
            ride.driver == self
        end
    end

    # paul.passengers --> [M, N]
    def passengers
        # paul.rides --> [PM, PM, PN]
        passengers_with_duplicates = self.rides.map do |ride|
            ride.passenger
        end
        # passengers_with_duplicates --> [M, M, N]
        passengers_with_duplicates.uniq # --> [M, N]
    end

    # I'm writing a total_distance instance method for drivers as a helper
    # Just like matteo.total_distance helped me with Passenger.premium_members,
    # this will help me with Driver.mileage_cap

    def total_distance
        # paul.rides --> [PM, PM, PN]
        distances = self.rides.map do |ride|
            ride.distance 
        end
        # distances --> [6, 20, 20]
        distances.sum # --> 46
    end


    # Driver.mileage_cap(50) --> [S]
    def self.mileage_cap(distance)
        # Driver.all --> [P, S]
        self.all.select do |driver|
            # shannon.total_distance --> 219
            # distance --> 50
            driver.total_distance > distance
        end
    end

end
