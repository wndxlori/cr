# Builders for the multiselect controls

module ActionView
  module Helpers

    module FormTagHelper

      def multiselect_control_tag(name, values, value = nil, options ={})
        generate_multiselect( name, value, values, nil, options )
      end
    
      def autocomplete_multiselect_tag(name, value, source, options ={})
        generate_multiselect( name, value, nil, source, options )
      end
    
    private
      def add_match_options( options = {} )
        options.merge( :multiple => true, :size => 6, :class => 'multiselectmatch')
      end
      def add_selected_options( options = {} )
        options.merge( :multiple => true, :size => 6, :class => 'multiselectselected')
      end
      #
      # Method used to rename the multiselect key to a more standard
      # data-multiselect key
      #
      def rename_multiselect_option(options)
        options["data-multiselect"] = options.delete(:multiselect)
        options
      end
    
      def generate_multiselect(name, match, values, source, options={})
        options[:multiselect] = source unless source.nil?
        updated_options = rename_multiselect_option(options)
        select_match_options = add_match_options(updated_options)
        select_selected_options = add_selected_options(updated_options)
        text_autocomplete_tag = source.nil? ? "" : text_field_tag( 'match', match || 'Enter match text', options.merge(:class => 'multiselecttext'))
        content_tag(:div, updated_options.merge(:class => 'multiselect')) do
          text_autocomplete_tag +
          select_tag( name.to_s + "_match", values, select_match_options) +
          select_tag( name.to_s + "_selected", nil, select_selected_options) +
          content_tag( :div, :class => 'multiselectbuttons') do
            submit_tag( 'Add', :name => 'match2selected') +
            tag(:br) +
            submit_tag( 'Add All', :name => 'match2selected', :class => 'all') +
            tag(:br) +
            submit_tag( 'Remove', :name => 'selected2match') +
            tag(:br) +
            submit_tag( 'Remove All', :name => 'selected2match', :class => 'all')
          end +
          hidden_field_tag( "#{name.to_s}_ids[]", nil, :class => 'multiselectids' )
        end
      end
    end
  end
end
