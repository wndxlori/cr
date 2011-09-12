require 'rails/generators'

class PoweruxMultiselectGenerator < Rails::Generators::Base
  desc "Run this generator to enable PowerUX Multiselect in your Rails application"

  source_root File.join(File.dirname(__FILE__), 'templates')
  
  def install
    # Copy the unobtrusive JS file
    copy_file('powerux-multiselect-busy.gif', 'public/images/powerux/multiselect-busy.gif')
    copy_file('powerux-multiselect.css', 'public/stylesheets/powerux/multiselect.css')
    copy_file('powerux-multiselect-rails.js', 'public/javascripts/powerux-multiselect-rails.js')
  end
  
  # def manifest
  #   puts "Installing"
  #   record do |m|
  #     m.file 'powerux-multiselect-rails.js',
  #            'public/javascriptspowerux-multiselect-rails.js',
  #            :collision => :ask
  # 
  #     m.file 'powerux-multiselect.css',
  #            'public/stylesheets/powerux/multiselect.css',
  #            :collision => :ask
  #   end
  # end
end
