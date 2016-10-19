class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    url: "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    path: ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    styles: { content: ["720x720>", :jpg], original: ["2000x2000>", :jpg], thumb: ["200x115#", :jpg] },
                    convert_options: { content: "-strip", original: "-strip", thumb: "-strip" }

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 8.megabytes
  validates_attachment_content_type :data, content_type: /\Aimage/

  def url_content
    url(:content)
  end
end
