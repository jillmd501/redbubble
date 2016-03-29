require 'spec_helper'

describe Work do
  describe "make" do
    context "complete test data" do
      before(:all) do
        @results = Work.make("#{File.dirname(__FILE__)}/../data/input/works.xml")
        @work = @results.first
      end
      it "should load the make" do
        @work.make.should == "NIKON CORPORATION"
      end
      it "should load the model" do
        @work.model.should == "NIKON D80"
      end
      it "should load the id" do
        @work.id.should == "31820"
      end
      it "should load the thumbnail" do
        @work.thumbnail.should == "http://ih1.redbubble.net/work.31820.1.flat,135x135,075,f.jpg"
      end
      it "should load the filename" do
        @work.filename.should == "162042.jpg"
      end
    end
  end
end
