class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end  # Ends initialize method

  def deposit(deposit_amt)
    @balance += deposit_amt
  end  # ends deposit method

  def display_balance
    "Your balance is $#{@balance}."
  end  #ends display_balance method

  def valid?
    @status == "open" &&  @balance > 0
  end  #  Ends valid? method

  def close_account
    @status = "closed"
  end  # ends close_account method

end
