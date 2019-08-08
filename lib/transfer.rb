require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount

  end 

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
    
  end



  def execute_transaction


    if self.sender.balance >= self.amount && self.status == "pending" && self.receiver.status == "open"
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount 
        self.status = "complete"
    elsif self.sender.balance < self.amount || self.receiver.status == "closed"
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  #binding.pry
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount 
      self.status = "reversed"
  end
end








end
