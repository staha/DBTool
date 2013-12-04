class DialogueLine < LmsDatabase
  belongs_to :transcript, counter_cache: :lines_of_dialogue_count, touch: true

  has_many   :rubric_keys, dependent: :destroy
  accepts_nested_attributes_for :rubric_keys

  attr_accessor   :hasBeenSentToLMS, :currentStatus, :timeEnqueued
  attr_accessible :hasBeenSentToLMS, :currentStatus, :timeEnqueued, :rubric_keys_attributes,
    :said_at, :group, :speaker, :listener, :topic, :meaning, :speech, :match_status, :position,
    :eventtype

  validates_presence_of :transcript_id
  validates_uniqueness_of :speech, scope: [:transcript_id, :said_at]
  validates_uniqueness_of :position, scope: :transcript_id

  delegate :chapter, to: :transcript

  def self.to_csv(options = {})
      columns = [:created_at, :speech, :speaker, :match_status]
      CSV.generate(options) do |csv|
      csv << columns
      all.each do |search|
          csv << [search.created_at, search.speech, search.speaker, search.match_status]
      end
      end
  end

end

