module PostsHelper

  def image(filename, large: true, alt: nil)
    base = "https://s3.us-east-2.amazonaws.com/jessicadussault.com"
    size = large ? "large" : "small"
    path = File.join(base, size, filename)
    image_tag path, class: size, alt: alt
  end

end