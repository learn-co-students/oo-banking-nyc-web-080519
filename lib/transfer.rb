class Transfer
  
  attr_accessor :receiver, :sender, :status, :amount

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance >= @amount && self.status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
    else
      #if !valid? || sender.balance < @amount || @status == "complete"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end
