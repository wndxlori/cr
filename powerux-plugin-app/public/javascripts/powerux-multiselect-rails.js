/*
* Unobtrusive multiselect with autocomplete
*
* To use it, you just have to include the HTML attribute multiselect
* with the autocomplete URL as the value
*
*/
$(function() {
    $('div.multiselectbuttons > input').live('click', function(i) {
		var arr = $(this).attr("name").split("2");
		var from = arr[0];
		var to = arr[1];
		var multiselect_list = $(this).parent().parent();
		var to_select = multiselect_list.find("select.multiselect" + to);

		// Chooses selected options or all options
		var option_selector = ' option:selected';
		if ( $(this).hasClass('all')) { 
			option_selector = ' option';
		}

		// Moves options from one list to the other list
		multiselect_list.find("select.multiselect" + from + option_selector).each(function(){
		    var new_option = $(this).clone();
		    to_select.append(new_option);
		    // Sort "to" list options after new option appended
		    to_select.html(multiselect_list.find("select.multiselect" + to + " option").sort(function (a, b) {
		        return a.text == b.text ? 0 : a.text < b.text ? -1 : 1;
		    }));
		    $(this).remove(); // TODO: reconsider using detach() 
		    new_option.effect("highlight", {}, 3000);
		});
  
	   // Saves the id's of selected items in the hidden field
		var selected_ids = new Array();
		multiselect_list.find("select.multiselectselected option").each(function(){
			selected_ids.push($(this).val());
		});
		multiselect_list.find('input:hidden').val(selected_ids.join(','));
  
		// to remove items not matching filter
		multiselect_list.find('.multiselecttext').autocomplete("search");
    });

    $('input[data-multiselect]').live('focus', function(i){
		$(this).autocomplete({
	            minLength: 0,
	            source: $(this).attr('data-multiselect'),
	            focus: function(event, ui) { return false; },
	            select: function( event, ui ) { return false; }
	    })      
	    .data( "autocomplete" )._response = function( items ) {
			// From original
			if ( items.length ) {
			    items = this._normalize( items );
			}
			var div_parent = $(this.element[0]).parent();  
			// Empty match list and refill with response items
			var match_select = div_parent.find('select.multiselectmatch');
			match_select.empty();
			$.each(items, function(index, item){
			        match_select.
			        append($("<option></option>").
			        attr("value",item.id).
			        text(item.value));
			});     

			// Ensures previously selected items don't appear in the match list
			div_parent.find('select.multiselectselected option').each(function(index, item){
				match_select.find("option[value='" + $(this).val() + "']").remove();
			});
	    };
	});
});
