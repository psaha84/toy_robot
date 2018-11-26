
require 'spec_helper'

describe Table do
  describe "#is_valid_position?" do
    let(:table) { Table.new }

    context "when position data is valid" do
      let(:position) { Position.new(0, 0, 'NORTH') }

      it "should return true" do
        expect(table.is_valid_position?(position)).to be_truthy
      end
    end

    context "when position data is not valid" do
      context "the values of x and y are less than 0" do
        let(:position) { Position.new(-1, -1, 'NORTH') }
        

        it "should return false" do
          expect(table.is_valid_position?(position)).to be_falsy
        end
      end

      context "the values of x and y are greater or equal to 5" do
        let(:position) { Position.new(5, 5, 'NORTH') }
        

        it "should return false" do
          expect(table.is_valid_position?(position)).to be_falsy
        end
      end    
    end
  end
end
