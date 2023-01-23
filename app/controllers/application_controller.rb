class ApplicationController < ActionController::API
  include CanCan::ControllerAdditions
  before_action :authenticate_request
  attr_reader :current_user

  rescue_from CanCan::AccessDenied do |e|
    render json: {}, status: :forbidden
  end
  
  def append_info_to_payload(payload)
    super
    payload[:host] = request.host
    payload[:ip] = request.ip
    payload[:remote_ip] = request.remote_ip
    payload[:x_forwarded_for] = request.env['HTTP_X_FORWARDED_FOR']
    payload[:current_user_email] = begin
                                     current_user.email
                                   rescue StandardError
                                     'No User'
                                   end
    payload[:current_user_id] = begin
                                  current_user.id
                                rescue StandardError
                                  'No User'
                                end
  end

  private

  def authenticate_request
    command = AuthorizeApiRequest.call(request.headers)
    @current_user = command.result
    render json: { error: command.errors }, status: :unauthorized unless @current_user
  end
end
