class StripeService
	require 'stripe'
	def initialize()
		Stripe.api_key = ENV['Stripe_Secret_key']
	end

end