class CreateUserSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :user_skills do |t|
      t.references :skill, foreign_key: true
      t.references :user, foreign_key: true
      t.string :level
      t.string :integer

      t.timestamps
    end
  end
end
