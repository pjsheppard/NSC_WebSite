### 
# Compass
###

# Susy grids in Compass
# First: gem install compass-susy-plugin
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Haml
###

# CodeRay syntax highlighting in Haml
# First: gem install haml-coderay
# require 'haml-coderay'

# CoffeeScript filters in Haml
# First: gem install coffee-filter
# require 'coffee-filter'

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

###
# Page command
###

# Per-page layout changes:
# 
# With no layout
# page "/path/to/file.html", :layout => false
# 
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
# 
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end


###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end
helpers do
  
  # Calculate the years for a copyright
  def copyright_years(start_year)
    end_year = Date.today.year
    if start_year == end_year
      start_year.to_s
    else
      start_year.to_s + '-' + end_year.to_s
    end
  end
  
  # site_name method
  def site_name
    "The Nottingham Sailing Club"
  end
  
  # page_title method
  def page_title(pagename)
    @current_page_name = pagename
    site_name + " | " + pagename
  end
  
  # section_name method
  def section_name(sectionname)
    @current_section_name = sectionname
    return nil
  end
  
  # nav_link method
  def nav_link(args)
    displayname = args[:displayname]
    target = args[:target]
    last = args[:lastlink]
  
    activeclass = ""
    
    if last == true then
      activeclass = displayname == @current_page_name ? " class=\"active last\" " : " class=\"last\" "
    else
      activeclass = displayname == @current_page_name ? " class=\"active\" " : " "
    end
    "<a href=\"" + target + "\"" + activeclass + ">" + displayname + "</a>"
  end
  
  # section_nav_link method
  def section_nav_link(args)
    displayname = args[:displayname]
    target = args[:target]
    last = args[:lastlink]
    
    activeclass = ""
    
    if last == true then
      activeclass = displayname == @current_section_name ? " class=\"active last\" " : " class=\"last\" "
    else
      activeclass = displayname == @current_section_name ? " class=\"active\" " : " "
    end
    "<a href=\"" + target + "\"" + activeclass + ">" + displayname + "</a>"    
  end
  
  # date_helper method
  def date_helper(date)
    d = Date.parse(date)
    
    daynum = d.strftime("%e").to_i
    monthname = d.strftime("%B")
    
    suffix =  if      [1, 21, 31].include?(daynum)    then "st"
              elsif   [2, 22].include?(daynum)        then "nd"
              elsif   [3, 23].include?(daynum)        then "rd"
              else                                         "th"
              end
    
    "#{daynum.to_s}#{suffix} #{monthname}"
  end
  
  # day_helper method
  def day_helper(date)
    d = Date.parse(date)
    
    dayname = d.strftime("%^a")
    
    "#{dayname}"
  end
  
  
end
# Change the CSS directory
# set :css_dir, "alternative_css_directory"

# Change the JS directory
# set :js_dir, "alternative_js_directory"

# Change the images directory
# set :images_dir, "alternative_image_directory"

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css
  
  # Minify Javascript on build
  activate :minify_javascript
  
  # Enable cache buster
  activate :cache_buster
  
  # Use relative URLs
  activate :relative_assets
  
  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher
  
  # Or use a different image path
  # set :http_path, "/Content/images/"
end
