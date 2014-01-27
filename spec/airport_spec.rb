# My main issue with this test file is that it tests several classes at once
# instead of concentrating on the airport (this isn't applicable to the grand finale, though)

require 'airport'
require 'plane'
#include AirTrafficControl
 
# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport and how that is impermented.
#
# If the airport is full then no planes can land
describe Airport do
  let(:airport) { Airport.new }
  let(:atc) { AirTrafficControl.new }
  let(:weather) { Weather.new}
    
  context 'taking off and landing' do
    it 'a plane can land' do
      weather = double("weather", :good_to_fly? => true, :good_to_land? => true )
      plane = atc.new_plane
      expect(plane.status).to eq(:flying)

      all_planes = atc.planes
      all_planes.each_with_index {|plane, i| 
        plane.land(airport,weather)
        expect(plane.status).to eq(:landed)
        expect(airport.planes?).to eq(i + 1)
      }
      expect(plane.status).to eq(:landed)
    end
    
    it 'a plane can take off' do
      weather = double("weather", :good_to_fly? => true, :good_to_land? => true )
      
      plane = atc.new_plane
      expect(plane.status).to eq(:flying)
      plane.land(airport,weather)
      expect(plane.status).to eq(:landed)
      plane.takeoff(airport,weather)
      expect(plane.status).to eq(:flying)
    end
  end
  
  context 'traffic control' do
    it 'a plane cannot land if the airport is full' do
      weather = double("weather", :good_to_fly? => true, :good_to_land? => true )
      airport = double("airport", :is_full? => true)

      plane = atc.new_plane
      expect(plane.status).to eq(:flying)
      plane.land(airport,weather)
      expect(plane.status).to eq(:flying)
    end
    
    # Include a weather condition using a module.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy, the plane can not take off and must remain in the airport.
    # 
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport
    context 'weather conditions' do
      it 'a plane cannot take off when there is a storm brewing' do
        weather = double("weather", :good_to_fly? => true, :good_to_land? => true )
      
        plane = atc.new_plane
        expect(plane.status).to eq(:flying)
        plane.land(airport,weather)
        expect(plane.status).to eq(:landed)

         weather = double("weather", :good_to_fly? => false, :good_to_land? => true )

        plane.takeoff(airport,weather)
        expect(plane.status).to eq(:landed)        
      end
      
      it 'a plane cannot land in the middle of a storm' do

        weather = double("weather", :good_to_fly? => true, :good_to_land? => false )
      
        plane = atc.new_plane
        expect(plane.status).to eq(:flying)
        plane.land(airport,weather)
        expect(plane.status).to eq(:flying)

      end
    end
  end
end
 

 
# grand final
# Given 6 planes, each plane must land. When the airport is full, every plane must take off again.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have the right status "landed"
# Once all the planes are in the air again, check that they have the status of flying!
describe "The gand finale (last spec)" do
  let(:airport) { Airport.new }
  let(:atc) { AirTrafficControl.new }
  let(:weather) { Weather.new}

  it 'all planes can land and all planes can take off' do
    airport.capacity= 6
    airport.capacity.times { atc.new_plane }

    weather.good_to_fly = true

    all_planes = atc.planes

    all_planes.each_with_index {|plane, i| 
      plane.land(airport,weather)
      expect(plane.status).to eq(:landed)
      expect(airport.planes?).to eq(i + 1) # a method that ends with "?" must return a boolean, not a number
    }
    expected_count = all_planes.length
    all_planes.each {|plane| 
      plane.takeoff(airport,weather)
      expect(plane.status).to eq(:flying)
      expected_count -= 1
      expect(airport.planes?).to eq(expected_count)
    }
  end
end