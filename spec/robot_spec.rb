
require 'spec_helper'

describe Robot do
  let(:table) { Table.new }

  describe "#placed" do
    let(:robot)    { Robot.new(table) }
    let(:position) { Position.new(table, 0, 0, 'NORTH') }

    it "should assigned the position" do
      robot.placed(position)
      expect(robot.position).to eq(position)
    end
  end  
  
  describe "#get_position" do
    let(:robot)    { Robot.new(table) }
    let(:position) { Position.new(table, 0, 0, 'NORTH') }

    it "should return composite output of the position" do
      robot.placed(position)
      expect(robot.get_position).to eq("0,0,NORTH")
    end
  end  

  describe "#move" do
    let(:table)    { Table.new }
    let(:robot)    { Robot.new(table) }
    
    context "when move to north" do
      it "should increase the value of x position by one" do
        robot.placed(Position.new(table, 2, 2, 'NORTH'))
        robot.move
        expect(robot.get_position).to eq("3,2,NORTH")
      end
    end

    context "when move to west" do
      it "should increase the value of y position by one" do
        robot.placed(Position.new(table, 2, 2, 'WEST'))
        robot.move
        expect(robot.get_position).to eq("2,3,WEST")
      end
    end
  
    context "when move to east" do
      it "should decrease the value of y position by one" do
        robot.placed(Position.new(table, 2, 2, 'EAST'))
        robot.move
        expect(robot.get_position).to eq("2,1,EAST")
      end
    end

    context "when move to south" do
      it "should decrease the value of x position by one" do
        robot.placed(Position.new(table, 2, 2, 'SOUTH'))
        robot.move      
        expect(robot.get_position).to eq("1,2,SOUTH")
      end
    end

    context "when robot is already reached to edge of the table" do
      it "should not increase the value of x position by one" do
        robot.placed(Position.new(table, 4, 0, 'NORTH'))
        robot.move
        expect(robot.get_position).to eq("4,0,NORTH")
      end

      it "should not increase the value of y position by one" do
        robot.placed(Position.new(table, 0, 4, 'WEST'))
        robot.move
        expect(robot.get_position).to eq("0,4,WEST")
      end
    end
  end
  
  describe "#left" do
    let(:robot)    { Robot.new(table) }
    
    context "when orientation is north" do
      it "should change orientation to west" do
        robot.placed(Position.new(table, 2, 2, 'NORTH'))
        robot.left
        expect(robot.get_position).to eq("2,2,WEST")
      end
    end

    context "when orientation is west" do
      it "should change orientation to south" do
        robot.placed(Position.new(table, 2, 2, 'WEST'))
        robot.left
        expect(robot.get_position).to eq("2,2,SOUTH")
      end
    end

    context "when orientation is south" do
      it "should change orientation to east" do
        robot.placed(Position.new(table, 2, 2, 'SOUTH'))
        robot.left
        expect(robot.get_position).to eq("2,2,EAST")
      end
    end

    context "when orientation is east" do
      it "should change orientation to north" do
        robot.placed(Position.new(table, 2, 2, 'EAST'))
        robot.left
        expect(robot.get_position).to eq("2,2,NORTH")
      end
    end  
  end

  describe "#right" do
    let(:robot)    { Robot.new(table) }
    
    context "when orientation is north" do
      it "should change orientation to east" do
        robot.placed(Position.new(table, 2, 2, 'NORTH'))
        robot.right
        expect(robot.get_position).to eq("2,2,EAST")
      end
    end

    context "when orientation is west" do
      it "should change orientation to north" do
        robot.placed(Position.new(table, 2, 2, 'WEST'))
        robot.right
        expect(robot.get_position).to eq("2,2,NORTH")
      end
    end

    context "when orientation is south" do
      it "should change orientation to west" do
        robot.placed(Position.new(table, 2, 2, 'SOUTH'))
        robot.right
        expect(robot.get_position).to eq("2,2,WEST")
      end
    end

    context "when orientation is east" do
      it "should change orientation to south" do
        robot.placed(Position.new(table, 2, 2, 'EAST'))
        robot.right
        expect(robot.get_position).to eq("2,2,SOUTH")
      end
    end
  end

  describe "#placed?" do
    let(:table)    { Table.new }
    let(:robot)    { Robot.new(table) }
   
    context "position is not assigned" do
      it "should return false" do
        expect(robot.placed?).to be_falsy
      end
    end

    context "position is assigned" do
      it "should return false" do
        robot.placed(Position.new(table, 2, 2, 'NORTH'))
        expect(robot.placed?).to be_truthy
      end
    end
  end
end
