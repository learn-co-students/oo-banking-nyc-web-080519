require 'pry'
class Transfer

  attr_reader :sender, :receiver
  attr_accessor :amount, :status
  @@all = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    Transfer.all << self
  end

  def self.all
    @@all
  end

  def valid?
    if sender.valid? && receiver.valid? && self.status == "pending"
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? && self.amount <= sender.balance
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
