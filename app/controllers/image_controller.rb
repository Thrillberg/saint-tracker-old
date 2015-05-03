class ImageController < ApplicationController
    require 'rubygems'
    require 'RMagick'

   def createThumbnail
     width, height = 100, 100

     img =  Magick::Image.read(work.image).first
     thumb = img.resize(width, height)
     
     # If you want to save this image use following
     # thumb.write("mythumbnail.jpg")

     # otherwise send it to the browser as follows
     send_data(thumb.to_blob, :disposition => 'inline', 
                            :type => 'image/jpg')
   end
end