require "pry"
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end # Ends initialize method

  def valid?
    # binding.pry
    self.sender.valid? && self.receiver.valid?
  end  # ends valid? method
  
  def execute_transaction
    # binding.pry
    if self.valid? 
      if self.status == "pending" && self.sender.balance > self.amount
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else 
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end 
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
