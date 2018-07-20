class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
    @game = Game.find(params[:game_id])
    # TODO: calculate payable amount for UI and Stripe
    @description = payment_description
    @amount = payable_amount
  end

  def create
    # TODO: save payment details
    # @payment = Payment.new(payment_params)
    @game = Game.find(params[:game_id])

    @amount = 400

    charge = Stripe::Charge.create(
      :source      => params[:stripeToken],
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'nzd'
    )

    redirect_to @game, notice: "Thanks you!"
    # TODO: Paid players

  rescue Stripe::CardError => e
    flash[:error] = e.message
    render action: 'new'
    #redirect_to new_payment_path
  end
  
  private

  def payment_description
    @game.team + ' (' + @game.game_date.to_s + ') - ' + @game.name
  end

  def payable_amount
    # TODO: do something smart with @game.cost and players here
  end
  
  def payment_params
    params.permit(:authenticity_token, :stripeToken, :stripeEmail, :game_id)
  end
end
