# == Schema Information
#
# Table name: posts
#
#  id           :bigint(8)        not null, primary key
#  catagory     :string
#  title        :string
#  description  :text
#  comments     :text
#  keyword      :string
#  numphoto     :integer
#  slug         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :integer
#  published    :boolean          default(FALSE)
#  published_at :datetime
#

class Post < ApplicationRecord

  acts_as_taggable # Alias for acts_as_taggable_on :tags

  extend FriendlyId
    friendly_id :title, use: :slugged



    belongs_to :author, :optional => true

    scope :most_recent, -> {order(published_at: :desc)}
    scope :published, -> {where(published:true)}

    has_many_attached :images
     scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }
     scope :with_preloaded_image, -> { preload(image_attachment: :blob) }





    def should_generate_new_friendly_id?
       title_changed?
    end

    def display_day_published
            if published_at.present?
        	"#{published_at.strftime("%B,%d %Y")}"
            else "Not published yet."
            end
        end

        def publish
            update(published: true, published_at: Time.now)
        end

        def unpublish
            update(published: false, published_at: nil)
        end




end
