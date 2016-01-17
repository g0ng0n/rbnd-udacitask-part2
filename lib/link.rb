class LinkItem < Item
  include Listable
  attr_reader :description, :site_name

  def initialize(type, url, options={})
    @type = type

    @description = url
    @site_name = options[:site_name]
  end

  def details
    format_text(@type,10) + format_text(@description,25) + "site name: " + format_name(@site_name)
  end
end
