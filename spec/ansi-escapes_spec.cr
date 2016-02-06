require "./spec_helper"

module AnsiEscapes
  describe Cursor do
    describe ".home" do
      it "sets the cursor position" do
        Cursor.home.should eq "\e[H"
      end
    end

    describe ".to" do
      it "sets the cursor absolutely to the given X" do
        Cursor.to(10).should eq "\e[11G"
      end

      it "sets the cursor absolutely to the given X and Y" do
        Cursor.to(10, 20).should eq "\e[21;11H"
      end
    end

    describe ".up" do
      it "moves the cursor up" do
        Cursor.up.should eq "\e[1A"
        Cursor.up(3).should eq "\e[3A"
      end
    end

    describe ".down" do
      it "moves the cursor down" do
        Cursor.down.should eq "\e[1B"
        Cursor.down(3).should eq "\e[3B"
      end
    end

    describe ".forward" do
      it "moves the cursor forward" do
        Cursor.forward.should eq "\e[1C"
        Cursor.forward(3).should eq "\e[3C"
      end
    end

    describe ".backward" do
      it "moves the cursor backward" do
        Cursor.backward.should eq "\e[1D"
        Cursor.backward(3).should eq "\e[3D"
      end
    end

    describe ".move" do
      it "moves the cursor relatively by the given X and Y" do
        Cursor.move(10, 0).should eq "\e[10C"
        Cursor.move(-10, 0).should eq "\e[10D"
        Cursor.move(0, 10).should eq "\e[10B"
        Cursor.move(0, -10).should eq "\e[10A"
        Cursor.move(10, 10).should eq "\e[10C\e[10B"
        Cursor.move(-10, -10).should eq "\e[10D\e[10A"
        Cursor.move(10, -10).should eq "\e[10C\e[10A"
        Cursor.move(-10, 10).should eq "\e[10D\e[10B"
      end
    end
  end

  describe Erase do
    describe ".lines" do
      it "erases the given number of lines" do
        Erase.lines(0).should eq ""
        Erase.lines(1).should eq "\e[100D\e[K"
        Erase.lines(3).should eq "\e[100D\e[K\e[1A\e[100D\e[K\e[1A\e[100D\e[K"
      end
    end
  end
end
