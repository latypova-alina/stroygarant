class CreateProjectImages < ActiveRecord::Migration
  def change
    create_table :project_images do |t|
      t.references :project, index: true

      t.timestamps null: false
    end
    add_foreign_key :project_images, :projects
  end
end
