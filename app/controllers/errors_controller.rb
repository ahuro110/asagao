class ErrorsController < ActionController::Base
  layout "error"

  def show
    ex = request.env["action_dispatch.exception"]

    if ex.kind_of?(ActionController::RoutingError)
      render "not_found", status: 404, format: [:html]
    else
      render "internal_server_error", status: 500, format: [:html]
    end
  end
end
