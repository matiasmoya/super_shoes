class ErrorsDecorator
  attr_reader :error

  def initialize(error)
    @error = error
  end

  def as_json
    case error
    when 400
      { success: false, error_code: 400, error_msg: "Bad request" }
    when 401
      { success: false, error_code: 401, error_msg: "Not authorized" }
    when 404
      { success: false, error_code: 404, error_msg: "Record not found" }
    when 500
      { success: false, error_code: 500, error_msg: "Server error" }
    end
  end
end
