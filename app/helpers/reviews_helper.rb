module ReviewsHelper
  def delete_review_image
    image_tag('trash.png', style: 'border: 0', title: 'Delete Review')
  end
end
