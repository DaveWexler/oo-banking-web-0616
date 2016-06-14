require 'pry'
class Transfer
  
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if self.status == "pending" && (sender.valid? == true && receiver.valid? == true)
      return true
    else
      return false
    end
  end

  def execute_transaction
  #  binding.pry
    if self.valid? == true && self.amount < sender.balance
        receiver.deposit(amount)
        sender.balance -= @amount
        self.status = "complete"
      else
        self.status = "rejected"
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
