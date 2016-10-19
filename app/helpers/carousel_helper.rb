module CarouselHelper
  def carousel_for reviews
    Carousel.new(self, reviews).html
  end

  class Carousel
    def initialize view, reviews
      @view, @reviews = view, reviews
      @uid = SecureRandom.hex 6
    end

    def html
      content = safe_join [indicators, slides, controls]
      content_tag :div, content, id: uid, class: "carousel slide"
    end

    private
    attr_accessor :view, :reviews, :uid
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

    def indicators
      items = reviews.count.times.map { |index| indicator_tag index }
      content_tag :ol, safe_join(items), class: "carousel-indicators"
    end

    def indicator_tag index
      options = {
        class: (index.zero? ? "active" : ""),
        data: {
          target: uid,
          slide_to: index
        }
      }

      content_tag :li, "", options
    end

    def slides
      items = reviews.map.with_index { |review, index| slide_tag review, index.zero? }
      content_tag :div, safe_join(items), class: "carousel-inner"
    end

    def slide_tag review, is_active
      options = {
        class: (is_active ? "item active" : "item"),
      }

      content_tag :div, safe_join([link_to(image_tag(review.cover_image.url(:slideshow)), [review]),
        content_tag(:div, link_to(review.title, [review]), class: "carousel-caption")]), options
    end

    def controls
      safe_join [control_tag("left"), control_tag("right")]
    end

    def control_tag direction
      options = {
        class: "#{direction} carousel-control",
        data: { slide: direction == "left" ? "prev" : "next" }
      }

      icon = content_tag :i, "", class: "glyphicon glyphicon-chevron-#{direction}"
      control = link_to icon, "##{uid}", options
    end
  end
end
