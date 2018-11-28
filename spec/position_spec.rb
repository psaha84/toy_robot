
require 'spec_helper'

describe Position do
  let(:table) { Table.new }

  describe "#get_output" do
    let(:position) { Position.new(table, 0, 0, 'NORTH') }

    it "should return the composite value" do
      expect(position.get_output).to eq("0,0,NORTH")
    end
  end

  describe "#get_new_orientation" do
    let(:position) { Position.new(table, 0, 0, 'NORTH') }
    
    context "when change to left" do
      it "should return west if orientation is north" do
        expect(position.get_new_orientation("left")).to eq("WEST")
      end
    end


    context "when change to right" do
      it "should return east if orientation is north" do
        expect(position.get_new_orientation("right")).to eq("EAST")
      end
    end
  end

  describe "#valid?" do
    context "when data is valid" do
      let(:position) { Position.new(table, 0, 0, 'NORTH') }

      it "should return true" do
        expect(position.valid?).to be_truthy
      end
    end

    context "when position data is not valid" do
      context "when orientation is not given" do
        let(:position) { Position.new(table, 0, 0, nil) }
        
        it "should return false" do
          expect(position.valid?).to be_falsy
        end

        it "should give error" do
          position.valid?
          expect(position.errors).to include("Orientation must be present")
        end  
      end

      context "when orientation is given but not valid data" do
        let(:position) { Position.new(table, 0, 0, "NORTH EAST") }
        
        it "should return false" do
          expect(position.valid?).to be_falsy
        end

        it "should give error" do
          position.valid?
          expect(position.errors).to include("Orientation is not a valid")
        end  
      end

      context "the values of x and y are less than 0" do
        let(:position) { Position.new(table, -1, -1, 'NORTH') }
        

        it "should return false" do
          expect(position.valid?).to be_falsy
        end

        it "should give error" do
          position.valid?
          expect(position.errors).to include("Position is not in table.")
        end
      end

      context "the values of x and y are greater or equal to 5" do
        let(:position) { Position.new(table, 5, 5, 'NORTH') }
        
        it "should return false" do
          expect(position.valid?).to be_falsy
        end

        it "should give error" do
          position.valid?
          expect(position.errors).to include("Position is not in table.")
        end
      end    
    end
  end
end
