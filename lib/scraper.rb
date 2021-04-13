require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")


doc = Nokogiri::HTML(html)

puts doc.css(".headline-260IBN").text.strip

##########

require 'nokogiri'
require 'open-uri'

html = open("https://flatironschool.com/")


doc = Nokogiri::HTML(html)

#This section has the id 2a778efd-1685-5ec6-9e5a-0843d6a88b7b, and adding that to the final selector will produce: .css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G"). Even though the Nokogiri gem returns a Nokogiri::XML::NodeSet (which looks like an Array in Ruby), we can use Ruby methods, such as .each and .collect, to iterate over it.

doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")

courses = doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")

courses.each do |course|
  puts course.text.strip
end

##Operating on XML
#Let's take another look at the element returned to us by our call on the .css method. In the previous example, we had many Nokogiri objects to iterate over. Looking at just the first one:

  p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0]

#We get the following:
#<Nokogiri::XML::Element:0x3fc3494ba054 name="div" attributes=[#<Nokogiri::XML::Attr:0x3fc3494ba298 name="class" value="inlineMobileLeft-2Yo002 imageTextBlockGrid3-2XAK6G">] children=[#<Nokogiri::XML::Element:0x3fc3494abd88 name="div" attributes=[#<Nokogiri::XML::Attr:0x3fc3494abd24 name="class" value="media-3NKI6- horizontalImageContainer-1a2NpA">]...

#This is an XML element. XML stands for Extensible Markup Language. Just like HTML, it is a set of rules for encoding and displaying data on the web.
#When we use Nokogiri methods, we get XML elements in return. Looking at the output object, we can see it has a name, "h2". We can get this info directly by adding these to the end of our doc.css call:

  p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0].name
  # => "div"

## This is the name of the XML element, not to be confused with the HTML attribute 'name' that can be assigned to elements. Those types of attributes can be accessed with .attributes. Using .attributes will return ids, names, and classes, but will also return other useful content like alt and src for images.
  
  p doc.css("#2a778efd-1685-5ec6-9e5a-0843d6a88b7b .inlineMobileLeft-2Yo002.imageTextBlockGrid3-2XAK6G")[0].attributes





