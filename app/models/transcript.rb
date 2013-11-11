class Transcript < LmsDatabase

  belongs_to :student, class_name: 'User'
  belongs_to :assignment_attempt, touch: true
  # deprecated patient exam support
  belongs_to :patient_exam, touch: true

  has_many   :lines_of_dialogue, class_name: 'DialogueLine', dependent: :destroy
  has_many   :rubric_keys, dependent: :destroy

  # attr_accessible :session_time
  attr_accessible :assignment_attempt_id, :student_id

  validates_presence_of :student_id
  # deprecated patient exam support
  delegate :course_module, :level, :chapter, :review, to: :patient_exam
  delegate :course, :assignment, to: :assignment_attempt

  default_scope order: 'transcripts.created_at DESC'


end	