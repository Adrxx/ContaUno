class HomeworkUpload < ActiveRecord::Base


  belongs_to :group

  has_attached_file :homework, { preserve_files: false, url: "/system/:hash.:extension", hash_secret: "12c289abd0c4849a770423b606614762f389ce12c10e9daa5494932a832419154866fde907d16204c915a29e683840eb9cec63936bcaf54963ae671f772dcd58" }

  #validates_attachment_content_type :homework, content_type: /\Aapplication\/octet-stream\Z/
  validates_attachment_file_name :homework, matches: [/cun\Z/]


  validates :name,      presence: true
  validates :homework,      presence: true
  validates :email,     format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }, :allow_blank => false


  validate :code_exists

  def code_exists
    if !Group.exists?(:code => self.code)
      errors.add(:code, 'El código no es válido.')
    end
  end
end
