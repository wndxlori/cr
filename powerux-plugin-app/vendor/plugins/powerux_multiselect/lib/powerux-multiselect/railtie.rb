module PoweruxMultiselect
  class Railtie < Rails::Railtie
    initializer "powerux_multiselect.action_view" do |app|
      ActiveSupport.on_load :action_view do
        begin
          require 'rails3-jquery-autocomplete'
        rescue LoadError
          puts 'PowerUX Multiselect requires the rails3-jquery-autocomplete gem'
        end
        require 'powerux-multiselect/form_helper'
#        ActionView::Helpers.send(:include, PoweruxMultiselect::FormHelper ) 
#        ActionView::Helpers.send(:include, PoweruxMultiselect::FormTagHelper ) 
#        include PoweruxMultiselect::FormHelper
        include PoweruxMultiselect::FormTagHelper
      end
    end
  end
end