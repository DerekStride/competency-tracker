class CreateLearnablesTagsTable < ActiveRecord::Migration
  def change
    create_table :learnables_tags do |t|
      t.belongs_to :learnable, index: true
      t.belongs_to :tag, index: true
    end
  end
end
