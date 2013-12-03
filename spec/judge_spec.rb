require_relative '../lib/loader.rb'

describe Judge do

  [
    # First is always the winning hand
    #
    # SUITS
    [ [:"E", :"4"], [:"P", :"4"] ],
    [ [:"P", :"4"], [:"C", :"4"] ],
    [ [:"O", :"4"], [:"C", :"4"] ],
    [ [:"P", :"4"], [:"C", :"4"] ],
    # Basic Numering
    [ [:"C", :"5"], [:"E", :"4"] ],
    [ [:"O", :"6"], [:"E", :"5"] ],
    [ [:"O", :"6"], [:"E", :"5"] ],
    [ [:"E", :"12"], [ :"C", :"7"]],
    # 3 Espada
    [ [ :"E", :"3"], [:"E", :"4"]],
    [ [ :"E", :"3"], [:"P", :"3"]],
    [ [ :"E", :"3"], [:"E", :"2"]],
    [ [ :"E", :"3"], [:"C", :"1"]],
    # 1 de Espada
    [[:"E", :"1"], [:"E", :"2"]],
    [[:"E", :"1"], [:"O", :"7"]],
    [[:"E", :"1"], [:"E", :"7"]],
    [[:"E", :"1"], [:"E", :"3"]],
    [[:"E", :"1"], [:"P", :"1"]],
    # 1 PALO
    [[:"P", :"1"], [:"E", :"3"]],
    [[:"P", :"1"], [:"O", :"7"]],
    [[:"P", :"1"], [:"O", :"1"]],
    [[:"P", :"1"], [:"P", :"12"]],
    [[:"P", :"1"], [:"E", :"12"]],

    # 7 de Espada
    [[:"E", :"7"], [:"E", :"3"]],
    [[:"E", :"7"], [:"O", :"7"]],
    [[:"E", :"7"], [:"E", :"2"]],
    # 7 de Oro
    [[:"O", :"7"], [:"E", :"3"]],
    [[:"O", :"7"], [:"C", :"1"]],
    [[:"O", :"7"], [:"E", :"3"]],
    [[:"O", :"7"], [:"O", :"12"]],
    [[:"O", :"7"], [:"E", :"2"]],


    [[:"O", :"7"], [:"O", :"12"]]
    # otros

  ].each do |card|
      it "#{card[0][0]} #{card[0][1] } > #{card[1][0]} #{card[1][1]}" do
        card1 = Card.new(card[0][0], card[0][1])
        card2 = Card.new(card[1][0], card[1][1])
        judge = Judge.new([card1, card2])
        judge.winner.should == card1
      end
  end
end

describe "Perica" do

  [
    [[:"O", :"10"], [:"E", :"1"], [:"O", :"1"]],
    [[:"O", :"10"], [:"P", :"1"], [:"O", :"2"]],
    [[:"O", :"10"], [:"E", :"7"], [:"O", :"3"]],
    [[:"E", :"10"], [:"E", :"2"], [:"E", :"3"]],
    # cases for perica being 12
    [[:"E", :"12"], [:"E", :"1"], [:"E", :"10"]],
    [[:"P", :"12"], [:"E", :"1"], [:"P", :"10"]],
    [[:"O", :"12"], [:"E", :"7"], [:"O", :"10"]],


    # TODO: The test below should fail
    #
    [[:"O", :"12"], [:"O", :"7"], [:"E", :"10"]]

  ].each do |card|
    it "wins for #{card[1][0]} #{card[1][1]}" do
      card1 = Card.new(card[0][0], card[0][1])
      card2 = Card.new(card[1][0], card[1][1])
      vira = Card.new(card[2][0], card[2][1])
      judge = Judge.new([card1, card2])
      judge.vira = vira
      judge.winner.should == card1
    end
  end
 
end

describe "Perico" do
  [
    [[:"E", :"11"], [:"E", :"10"], [:"E", :"1"]],
    [[:"O", :"11"], [:"E", :"1"], [:"O", :"1"]],
    [[:"O", :"11"], [:"P", :"1"], [:"O", :"2"]],
    [[:"O", :"11"], [:"E", :"7"], [:"O", :"3"]],
    [[:"E", :"11"], [:"E", :"2"], [:"E", :"3"]],

    # cases for perico being 12
    [[:"E", :"12"], [:"E", :"1"], [:"E", :"11"]],
    [[:"E", :"12"], [:"O", :"7"], [:"E", :"11"]],

    [[:"P", :"12"], [:"E", :"1"], [:"P", :"11"]],
    [[:"E", :"12"], [:"P", :"12"], [:"E", :"11"]],
    [[:"O", :"12"], [:"O", :"7"], [:"O", :"11"]],
    [[:"O", :"7"], [:"O", :"12"], [:"E", :"11"]],

    # TODO: The test below should fail
    [[:"O", :"12"], [:"O", :"7"], [:"E", :"11"]]

  ].each do |card|
    it "wins for #{card[1][0]} #{card[1][1]}" do
      card1 = Card.new(card[0][0], card[0][1])
      card2 = Card.new(card[1][0], card[1][1])
      vira = Card.new(card[2][0], card[2][1])
      judge = Judge.new([card1, card2])
      judge.vira = vira
      judge.winner.should == card1
    end
  end
 
end
