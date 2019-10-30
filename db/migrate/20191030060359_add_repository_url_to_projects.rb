class AddRepositoryUrlToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :repository_url, :string, :after => :production_url
  end
end
