class Link < ActiveRecord::Base
  enum status: [:offline, :baoming_link, :friend_link]

  has_attached_file :cover, PAPERCLIP_CONFIG[:picture]

  validates_attachment :cover, content_type: {content_type: /^image\/(png|gif|jpeg|jpg)/},
                       size: { in: 0..20.megabytes}
end
