
require 'spec_helper'

describe Robot do
  let(:table) { Table.new }

  describe "#placed" do
    let(:robot)    { Robot.new }
    let(:position) { Position.new(0, 0, 'NORTH') }

    it "should assigned the position" do
      robot.placed(position)
      expect(robot.position).to eq(position)
    end
  end  
  
  describe "#get_position" do
    let(:robot)    { Robot.new }
    let(:position) { Position.new(0, 0, 'NORTH') }

    it "should return composite output of the position" do
      robot.placed(position)
      expect(robot.get_position).to eq("0,0,NORTH")
    end
  end  

  describe "#move" do
    let(:table)    { Table.new }
    let(:robot)    { Robot.new }
    
    context "when move to north" do
      it "should increase the value of x position by one" do
        robot.placed(Position.new(2, 2, 'NORTH'))
        robot.move(table)
        expect(robot.get_position).to eq("3,2,NORTH")
      end
    end

    context "when move to west" do
      it "should increase the value of y position by one" do
        robot.placed(Position.new(2, 2, 'WEST'))
        robot.move(table)
        expect(robot.get_position).to eq("2,3,WEST")
      end
    end
  
    context "when move to east" do
      it "should decrease the value of y position by one" do
        robot.placed(Position.new(2, 2, 'EAST'))
        robot.move(table)
        expect(robot.get_position).to eq("2,1,EAST")
      end
    end

    context "when move to south" do
      it "should decrease the value of x position by one" do
        robot.placed(Position.new(2, 2, 'SOUTH'))
        robot.move(table)      
        expect(robot.get_position).to eq("1,2,SOUTH")
      end
    end
  end
  
  describe "#left" do
    let(:robot)    { Robot.new }
    
    context "when orientation is north" do
      it "should change orientation to west" do
        robot.placed(Position.new(2, 2, 'NORTH'))
        robot.left
        expect(robot.get_position).to eq("2,2,WEST")
      end
    end

    context "when orientation is west" do
      it "should change orientation to south" do
        robot.placed(Position.new(2, 2, 'WEST'))
        robot.left
        expect(robot.get_position).to eq("2,2,SOUTH")
      end
    end

    context "when orientation is south" do
      it "should change orientation to east" do
        robot.placed(Position.new(2, 2, 'SOUTH'))
        robot.left
        expect(robot.get_position).to eq("2,2,EAST")
      end
    end

    context "when orientation is east" do
      it "should change orientation to north" do
        robot.placed(Position.new(2, 2, 'EAST'))
        robot.left
        expect(robot.get_position).to eq("2,2,NORTH")
      end
    end  
  end

  describe "#right" do
    let(:robot)    { Robot.new }
    
    context "when orientation is north" do
      it "should change orientation to east" do
        robot.placed(Position.new(2, 2, 'NORTH'))
        robot.right
        expect(robot.get_position).to eq("2,2,EAST")
      end
    end

    context "when orientation is west" do
      it "should change orientation to north" do
        robot.placed(Position.new(2, 2, 'WEST'))
        robot.right
        expect(robot.get_position).to eq("2,2,NORTH")
      end
    end

    context "when orientation is south" do
      it "should change orientation to west" do
        robot.placed(Position.new(2, 2, 'SOUTH'))
        robot.right
        expect(robot.get_position).to eq("2,2,WEST")
      end
    end

    context "when orientation is east" do
      it "should change orientation to south" do
        robot.placed(Position.new(2, 2, 'EAST'))
        robot.right
        expect(robot.get_position).to eq("2,2,SOUTH")
      end
    end
  end
end
