class Topic < ActiveRecord::Base
  has_and_belongs_to_many :prerequisites,
    class_name: 'Topic',
    foreign_key: :postreq_id,
    association_foreign_key: :prereq_id,
    join_table: :postrequisites_prerequisites
  has_and_belongs_to_many :postrequisites,
    class_name: 'Topic',
    foreign_key: :prereq_id,
    association_foreign_key: :postreq_id,
    join_table: :postrequisites_prerequisites

  belongs_to :competency
end
