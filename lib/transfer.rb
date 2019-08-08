class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if self.status == "pending"
      if sender.balance >= self.amount && self.valid?
        sender.balance -= self.amount
        receiver.balance += self.amount
        self.status = "complete"
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      if receiver.balance >= self.amount && self.valid?
        receiver.balance -= self.amount
        sender.balance += self.amount
        self.status = "reversed"
      end
    end
  end

end
