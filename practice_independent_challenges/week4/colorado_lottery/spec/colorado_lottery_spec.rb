require "./spec/spec_helper"

RSpec.describe ColoradoLottery do
    before(:each) do
        @lottery = ColoradoLottery.new
    end

    it "is an object" do
        expect(@lottery).to be_an_instance_of(ColoradoLottery)
    end

    it "starts with no contestants or winners" do
        expect(@lottery.registered_contestants).to eq({})
        expect(@lottery.winners).to eq([])
        expect(@lottery.current_contestants).to eq({})
    end

    describe "interest, registration, and lottery winners" do
        before(:each) do
            @pick_4 = Game.new('Pick 4', 2)
            @mega_millions = Game.new('Mega Millions', 5, true)
            @cash_5 = Game.new('Cash 5', 1)

            @alexander = Contestant.new({
                first_name: 'Alexander',
                last_name: 'Aigiades',
                age: 28,
                state_of_residence: 'CO',
                spending_money: 10})
            @benjamin = Contestant.new({
                first_name: 'Benjamin',
                last_name: 'Franklin',
                age: 17,
                state_of_residence: 'PA',
                spending_money: 100})
            @frederick = Contestant.new({
                first_name:  'Frederick',
                last_name: 'Douglass',
                age: 55,
                state_of_residence: 'NY',
                spending_money: 20})
            @winston = Contestant.new({
                first_name: 'Winston',
                last_name: 'Churchill',
                age: 18,
                state_of_residence: 'CO',
                spending_money: 5})
            @george = Contestant.new({
                first_name: 'George',
                last_name: 'Washington',
                age: 18,
                state_of_residence: 'CO',
                spending_money: 4})

            @alexander.add_game_interest('Pick 4')
            @alexander.add_game_interest('Mega Millions')
            @frederick.add_game_interest('Mega Millions')
            @winston.add_game_interest('Cash 5')
            @winston.add_game_interest('Mega Millions')
            @benjamin.add_game_interest('Mega Millions')
            @george.add_game_interest('Mega Millions')
        end

        it "checks if contestant interested and legal age" do
            expect(@lottery.interested_and_18?(@alexander, @pick_4)).to be true
            expect(@lottery.interested_and_18?(@benjamin, @mega_millions)).to be false
            expect(@lottery.interested_and_18?(@alexander, @cash_5)).to be false
        end

        it "checks if contestant can register" do
            expect(@lottery.can_register?(@alexander, @pick_4)).to be true
            expect(@lottery.can_register?(@alexander, @cash_5)).to be false
            expect(@lottery.can_register?(@frederick, @mega_millions)).to be true
            expect(@lottery.can_register?(@benjamin, @mega_millions)).to be false
            expect(@lottery.can_register?(@frederick, @cash_5)).to be false
        end

        it "registers contestants" do
            @lottery.register_contestant(@alexander, @pick_4)
            @lottery.register_contestant(@frederick, @mega_millions)
            @lottery.register_contestant(@benjamin, @mega_millions)

            expect(@lottery.registered_contestants).to eq({@pick_4 => [@alexander], @mega_millions => [@frederick]})
        end

        it "lists eligible contestants" do
            @lottery.register_contestant(@frederick, @mega_millions)
            @lottery.register_contestant(@winston, @mega_millions)
            @lottery.register_contestant(@george, @mega_millions)

            expect(@lottery.eligible_contestants(@mega_millions)).to eq([@frederick, @winston])
        end

        describe "current contestants" do
            it "charges contestant game cost" do
                expect(@alexander.spending_money).to eq(10)

                @lottery.register_contestant(@alexander, @mega_millions)
                @lottery.current_contestants
                expect(@alexander.spending_money).to eq(5)
            end

            it "lists current contestants by game" do
                @lottery.register_contestant(@alexander, @pick_4)
                @lottery.register_contestant(@alexander, @mega_millions)
                @lottery.register_contestant(@frederick, @mega_millions)
                @lottery.register_contestant(@george, @mega_millions)
                @lottery.register_contestant(@winston, @cash_5)

                expect(@lottery.current_contestants).to eq({@pick_4 => ["Alexander Aigiades"], @mega_millions => ["Alexander Aigiades", "Frederick Douglass"], @cash_5 => ["Winston Churchill"]})
            end
        end

        describe "winning scenario" do
            before(:each) do
                @lottery.register_contestant(@alexander, @pick_4)
                @lottery.register_contestant(@alexander, @mega_millions)
                @lottery.register_contestant(@frederick, @mega_millions)
                @lottery.register_contestant(@winston, @cash_5)
            end

            it "randomly draws winners" do
                @lottery.draw_winners
                expect(@lottery.winners.size).to eq(3)
                expect(@lottery.winners[0]).to be_a(Hash)
            end
        end
    end
end