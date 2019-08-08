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

  def execute_transaction
    #binding.pry
    if self.valid? && self.status != "complete" && self.sender.balance > amount
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
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
