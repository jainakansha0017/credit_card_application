class CreditCard < ApplicationRecord
	include AASM

	STATUSES = [:pending, :approved, :disapproved]

	validates :email, :monthly_recurring_inflow, :monthly_recurring_outflow, presence: true
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 

	after_create :calculate_credibility_score
	before_create :find_credit_limit

	enum status: STATUSES

	aasm column: 'status' do
    state :pending, initial: true
    state :approved, :disapproved

    event :approve do
      transitions from: :pending, to: :approved
    end

    event :disapprove do
      transitions from: [:pending, :approved], to: :disapproved
    end
  end

  def calculate_credibility_score
  	credit_score = CredibilityScore.call(email)
  	if credit_score > 2
  		self.approve!
  	else
  		self.disapprove!
  	end
  end

  def find_credit_limit
  	maximum_possible_emi = (monthly_recurring_inflow/2 - monthly_recurring_outflow)
  	self.credit_limit = maximum_possible_emi * find_term_in_months(maximum_possible_emi)
  end

  private

  def find_term_in_months(emi)
  	term_in_months = (
  		if emi >= 0 && emi <= 5000
  		  6
  		elsif emi >= 5001 && emi <= 10000
  			12
  		elsif emi <= 10001 && emi >= 20000
  			18
  		elsif emi >= 20001
  			24
  		else 
  			0
  		end
  	)
  end

end
