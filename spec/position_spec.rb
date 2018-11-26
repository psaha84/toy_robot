
require 'spec_helper'

describe Position do
  describe "#get_output" do
    let(:position) { Position.new(0, 0, 'NORTH') }

    it "should return the composite value" do
      expect(position.get_output).to eq("0,0,NORTH")
    end
  end

  describe "#get_new_orientation" do
    let(:position) { Position.new(0, 0, 'NORTH') }
    
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
end
