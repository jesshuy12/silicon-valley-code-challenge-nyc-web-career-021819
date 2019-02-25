require "pry"

class Startup

  attr_accessor :name
  attr_reader :founder, :domain

  @@all = []

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
    # binding.pry
  end

  def pivot(domain, name)
    @domain = domain
    @name = name
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founder)
    self.all.find do |startup|
      startup.founder == founder
    end
  end

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(venture_capitalist, funding_rounds, investment)
    FundingRound.new(self, venture_capitalist, funding_rounds, investment)
  end

  def num_funding_rounds
    count = 0
    #binding.pry
    FundingRound.all.each do |funding|
      if funding.startup == self
      # binding.pry
        count += 1
      end
    end
    count
  end

  def total_funds
    total = 0
    FundingRound.all.each do |funding|
      if funding.startup == self
        total += funding.investment
      end
    end
    total
  end

  def investors
    investors_arr = []

    FundingRound.all.each do |funding|
      if funding.startup == self
        investors_arr << funding.venture_capitalist
      end
    end

    investors_arr.uniq
  end


  def big_investors
    big_investors_arr = []

    FundingRound.all.each do |funding|
      if funding.startup == self && funding.venture_capitalist.total_worth > 1000000000
        big_investors_arr << funding.venture_capitalist
      end
    end
    big_investors_arr.uniq
  end

end
