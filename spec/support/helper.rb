module Helper
  def json
    JSON.parse(response.body)
  end
end
