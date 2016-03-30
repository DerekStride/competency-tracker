class CreateCompetencyJoinTable < ActiveRecord::Migration
  def change
    create_table :postrequisites_prerequisites do |t|
      t.integer :postreq_id
      t.integer :prereq_id
    end

    add_index(:postrequisites_prerequisites, [:postreq_id, :prereq_id], :unique => true)
    add_index(:postrequisites_prerequisites, [:prereq_id, :postreq_id], :unique => true)
  end
end
