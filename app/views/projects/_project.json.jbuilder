json.extract! project, :id, :name, :target, :overview, :hw_configuration, :sw_configuration, :production_url, :from, :to, :user_id, :created_at, :updated_at
json.url project_url(project, format: :json)
