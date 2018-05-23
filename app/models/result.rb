class Result < ActiveRecord::Base
  belongs_to :subtype
  has_and_belongs_to_many :questions
  has_attached_file :image, styles: {medium: '300x300>', thumb: '100x100>'}, default_url: '/images/:style/missing.png'

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def to_brief_api
    {
        id: self.id,
        age: self.age,
        name: self.name,
        shapes: {
            rect: self.rect,
            circle: self.circle,
            triangle: self.triangle
        },
        updated_at: self.updated_at,
        images: {
            original: self.image.url,
            thumb: self.image.url(:thumb),
            medium: self.image.url(:medium)
        }
    }
  end

  def to_api
    to_brief_api
        .merge({
                   subtype: self.subtype,
                   type: self.subtype.type,
                   questions: self.questions
               })
  end
end