json.extract! debit, :id, :frequency, :currency, :remarks, :amount, :user_id, :created_at, :updated_at
json.url user_debit_url(debit, format: :json)
