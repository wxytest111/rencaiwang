class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data, PAPERCLIP_CONFIG[:attachment_file]

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 20.megabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
