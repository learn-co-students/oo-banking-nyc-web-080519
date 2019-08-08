require 'pry'
class Transfer
    attr_accessor :sender, :receiver, :status , :amount

    @@all_transfers =[] 

  def self.all_transfers
    @@all_transfers
  end

  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid? 
    if self.sender.valid? && self.receiver.valid? 
      return true
    else 
      return false
    end 
  end 

  def past_transaction
    @@all_transfers.select do |transfer|
      transfer.sender.name == self.sender.name && transfer.receiver.name == self.receiver.name
    end 
  end 

  def execute_transaction
    #binding.pry
    if self.sender.balance < amount && !self.valid?
      return "Transaction rejected. Please check your account balance."
    end 
    if self.valid? && self.past_transaction.length == 0
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
      @@all_transfers << self
    end 
  end

  binding.pry






end
