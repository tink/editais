class Download < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :documento

  validates_presence_of :empresa_id, :documento_id
  validates :token, :presence => true, :uniqueness => true

  after_create :send_notification
  before_validation :generate_uniq_token, :on => :create

  def complete!
    update_attribute :completed, true
  end

  def generate_uniq_token
    while token.blank? || Download.find_by_token(token)
      try_another_token
    end
  end

  def send_notification
    DownloadNotifier.ready_download(self).deliver!
  end

  protected
  def try_another_token
    self.token = ActiveSupport::SecureRandom.base64(30).gsub!(/\W/, 'A')
  end
end
