class CreditCardsController < ApplicationController

  # GET /credit_cards or /credit_cards.json
  def index
    @credit_cards = CreditCard.all
  end

  # GET /credit_cards/new
  def new
    @credit_card = CreditCard.new
  end

  # POST /credit_cards or /credit_cards.json
  def create
    @credit_card = CreditCard.new(credit_card_params)

    respond_to do |format|
      if @credit_card.save
        format.html { redirect_to credit_cards_path, notice: "Credit card is applied and sent to admin for approva;." }
        format.json { render :show, status: :created, location: @credit_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def credit_card_params
      params.require(:credit_card).permit(
        :email,
        :aadhar_number,
        :pan_number,
        :account_number,
        :ifsc,
        :monthly_recurring_inflow,
        :monthly_recurring_outflow
        )
    end
end
