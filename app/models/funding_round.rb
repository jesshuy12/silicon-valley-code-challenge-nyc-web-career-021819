class FundingRound

  attr_reader :name, :venture_capitalist, :funding_rounds, :startup, :investment, :total_worth

  @@all = []

  def initialize(startup, venture_capitalist, funding_rounds, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @funding_rounds = funding_rounds
    @investment = investment.to_f
    @@all << self
  end

  def self.all
    @@all
  end

end
