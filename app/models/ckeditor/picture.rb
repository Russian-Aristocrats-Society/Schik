class Ckeditor::Picture < Ckeditor::Asset
  has_mongoid_attached_file :data,
                            :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                            :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                            :styles => { :content => '800>', :thumb => '118x100#' }
  
  if respond_to?(:validates_attachment_content_type)
    validates_attachment_content_type :data, :content_type => ['image/gif', 'image/jpeg', 'image/jpg', 'image/png'], if: :data?
  end
  validates_attachment_size :data, :less_than => 10.megabytes
  validates_attachment_presence :data

  def url_content
    url(:content)
  end
end
