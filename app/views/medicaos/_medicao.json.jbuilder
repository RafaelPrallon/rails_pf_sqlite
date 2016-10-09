json.extract! medicao, :id, :dataMedicao, :medida, :created_at, :updated_at
json.url medicao_url(medicao, format: :json)