require 'pry'

class Building
    attr_reader :address
    attr_accessor :name, :num_tenants

    @@all = []

    def initialize(name,address,num_floors,num_tenants)
        @name = name
        @address = address
        @num_floors = num_floors
        @num_tenants = num_tenants
        @@all << self
    end

    def self.all
        @@all
    end

    def self.avg_tenants
        total_tenants = self.all.reduce(0) do |sum,building|
            sum + building.num_tenants
        end
        avg_tenants = total_tenants / self.all.size
    end

    def placard
        p self.address
    end

    def avg_tenants_per_floor
        avg_tenants_per_floor = @num_tenants/@num_floors
    end

end


building1 = Building.new("Empire", "address 1", 101, 2000)
building2 = Building.new("Stuyvesant", "address 2", 38, 500)
building3 = Building.new("World Trade", "address 3", 208, 8500)

Building.avg_tenants

binding.pry