require 'google/apis/analyticsreporting_v4'
require 'googleauth'
class HomeuserController < ApplicationController
  before_action :authenticate_user!

  def index
    user = User.where.not(id: current_user.id)
    @products = Product.all
  end

  def dashboard; end


  def chatgpt
    flash.now[:notice] = params[:message] if params[:message].present?
  end

  def chatgpt_request
    ChatgptService.call(params[:message], self)
  end

  def google_analytics
     # binding.break
    # @client = Google::Apis::AnalyticsreportingV4::AnalyticsReportingService.new
    # @client.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
    #   json_key_io: File.open(Rails.root.join('public/key.json')),
    #   scope: 'https://www.googleapis.com/auth/analytics.readonly'
    # )
    #   request = Google::Apis::AnalyticsreportingV4::GetReportsRequest.new(
    #   report_requests: [
    #     Google::Apis::AnalyticsreportingV4::ReportRequest.new(
    #       view_id: '355533296',
    #       date_ranges: [
    #         Google::Apis::AnalyticsreportingV4::DateRange.new(
    #           start_date: "2023-03-01",
    #           end_date: "2023-04-31"
    #         )
    #       ],
    #       metrics: [
    #         Google::Apis::AnalyticsreportingV4::Metric.new(
    #           expression: 'ga:sessions'
    #         )
    #       ]
    #     )
    #   ]
    # )
    # response = @client.batch_get_reports(request)
    # response.reports.first.data.totals.first.values.first.to_i
    # service = GoogleAnalyticsService.new
    # @sessions = service.fetch_data('2023-03-01', '2023-03-31')
  end

  def add_cart
    user_cart = current_user.carts
    product = Product.find(params[:id])

    cart = current_user.cart
    Cart.update(product_id: product.id)
  end
end
