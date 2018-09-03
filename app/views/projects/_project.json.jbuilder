json.extract! project, :id, :name, :description, :duration, :owner, :created_at, :updated_at
json.url project_url(project, format: :json)
