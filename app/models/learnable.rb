class Learnable < ActiveRecord::Base
  has_and_belongs_to_many :prerequisites,
    class_name: 'Learnable',
    foreign_key: :postreq_id,
    association_foreign_key: :prereq_id,
    join_table: :postrequisites_prerequisites
  has_and_belongs_to_many :postrequisites,
    class_name: 'Learnable',
    foreign_key: :prereq_id,
    association_foreign_key: :postreq_id,
    join_table: :postrequisites_prerequisites

  has_and_belongs_to_many :tags
  belongs_to :competency


  self.inheritance_column = :type
  scope :competencies, -> { where(type: 'Competency') }
  scope :topics, -> { where(type: 'Topic') }
end
