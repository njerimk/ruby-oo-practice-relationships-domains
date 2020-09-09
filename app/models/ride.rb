class Ride

    @@all = []
    attr_reader :driver, :passenger, :distance

    def initialize(driver, passenger, distance)
        @driver, @passenger, @distance = driver, passenger, distance.to_f
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.average_distance
        # Ride.all --> [PM, PM, PN, SM, SA, SA, SA, SJ]
        distances = self.all.map {|ride| ride.distance}
        # distances --> [6.0, 20.0, 20.0, 13.0, 3.0, 35.0, 67.0, 101.0]
        sum = distances.sum # --> 265.0
        average = sum / self.all.length # 265.0 / 8 --> 33.125
    end

end