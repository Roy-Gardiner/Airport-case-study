require 'airport'
require 'plane'
require 'weather'
require 'rspec/mocks'
# When we create a new plane, it should have a "flying" status, thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should have its status changed to "landed"
#
# When the plane takes of from the airport, the plane's status should become "flying"
describe Plane do
  let(:airport) { Airport.new }
  let(:atc) { AirTrafficControl.new }
  let(:weather) { Weather.new}
 
  # So, this file is all about testing the plane
  # Why is this test focusing on the ATC?
  it 'has a flying status when created' do
    atc.new_plane
    expect(atc.planes.length).to eq(1)
    atc.new_plane
    expect(atc.planes.length).to eq(2)
    atc.new_plane
    expect(atc.planes.length).to eq(3)
    expect(atc.planes_flying?).to eq(true)
  end
  
  # You absolutely don't need the ATC to test this
  it 'has a flying status when in the air' do
    4.times { atc.new_plane }    
    atc.planes.each {|plane| 
      expect(plane.status).to eq(:flying)}
  end
  
  # Again, just use the plane
  it 'can land' do
    atc.new_plane
    atc.new_plane
    atc.new_plane
    atc.new_plane

    all_planes = atc.planes
    all_planes.each {|plane| 
      plane.land(airport,weather)
      expect(plane.status).to eq(:landed)}
    
  end

  it 'can take off' do
    atc.new_plane
    atc.new_plane
    atc.new_plane
    atc.new_plane
    # can't make 'double' work so use this workardound
    # You're right, it's a workaround, you should have used
    # doubles or stubbing instead
    weather.good_to_fly= true

    all_planes = atc.planes
    all_planes.each {|plane| 
      plane.land(airport,weather)
      expect(plane.status).to eq(:landed)
    }
    all_planes.each {|plane| 
      plane.takeoff(airport,weather)
      expect(plane.status).to eq(:flying)
    }
  end 
  it "respects weather" do

    atc.new_plane
    atc.new_plane
    atc.new_plane
    atc.new_plane

    weather.good_to_fly = false

    all_planes = atc.planes

    all_planes.each_with_index {|plane, i| 
      plane.land(airport,weather)
      expect(plane.status).to eq(:landed)
      expect(airport.planes?).to eq(i + 1)
    }
    all_planes.each {|plane| 
      plane.takeoff(airport,weather)
      expect(plane.status).to eq(:landed)
      expect(airport.planes?).to eq(4)
    }
  end
end