class VentureCapitalist

  attr_accessor :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end

  def self.all
    @@all
  end

  def self.tres_commas_club
    self.all.map do |capitalist|
      if capitalist.total_worth > 1000000000
        capitalist.name
      end
    end
  end

  def offer_contract(startup, funding_rounds, investment)
    FundingRound.new(startup, self, funding_rounds, investment)
  end

  def funding_rounds
    FundingRound.all.select do |funding|
      funding.venture_capitalist == self
    end
  end

  def portfolio
    funded_startups = []
    FundingRound.all.each do |funding|
      if funding.venture_capitalist == self
        funded_startups << funding.startup
      end
      #binding.pry
      # funding.venture_capitalist == self
    end
    funded_startups.uniq
  end

  def biggest_investment
    funding_round = FundingRound.all.select do |funding|
      funding.venture_capitalist == self
    end
    #binding.pry
    funding_round.sort_by do |funding|
      funding.investment
    end.last
  end

  def invested(domain)
    round = FundingRound.all.select do |funding|
        funding.startup.domain == domain
    end
    total = 0
    round.each do |fund|
      total += fund.investment
    end
    total
  end



end
