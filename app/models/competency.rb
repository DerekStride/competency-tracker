class Competency < ActiveRecord::Base
  has_and_belongs_to_many :prerequisites,
    class_name: 'Competency',
    foreign_key: :postreq_id,
    association_foreign_key: :prereq_id,
    join_table: :postrequisites_prerequisites
  has_and_belongs_to_many :postrequisites,
    class_name: 'Competency',
    foreign_key: :prereq_id,
    association_foreign_key: :postreq_id,
    join_table: :postrequisites_prerequisites

  has_and_belongs_to_many :tags
  has_many :learning_sources

  belongs_to :topic, class_name: 'Competency', foreign_key: :competency_id
  has_many :subtopics, class_name: 'Competency', foreign_key: :competency_id

  has_many :user_competencies
  has_many :users, through: :user_competencies

  validates :name, presence: true
end
