/*
 *  Unobtrusive selectable list
 *  
 *  Given a selectable list div
 *  	Attach add, addall, remove, removeall functions to
 *      the input buttons
 *
 */
$(function() {
   $('.selectablelistbuttons > input').click( function () {
		var arr = $(this).attr("name").split("2");
		var from = arr[0];
		var to = arr[1];
		var selectable_list = $(this).parent().parent();
		var to_select = selectable_list.find("select.selectablelist" + to);
		
		// Chooses selected options or all option
		var option_selector = ' option:selected';
		if ( $(this).hasClass('all')) { 
			option_selector = ' option';
		}
		
		// Moves options from one list to the other list
		selectable_list.find("select.selectablelist" + from + option_selector).each(function(){
			var new_option = $(this).clone();
			to_select.append(new_option);
			// Sort "to" list options after new option appended
			to_select.html(selectable_list.find("select.selectablelist" + to + " option").sort(function (a, b) {
			    return a.text == b.text ? 0 : a.text < b.text ? -1 : 1;
			}));
			$(this).remove(); // TODO: reconsider using detach() 
			new_option.effect("highlight", {}, 3000);
		});
		
		// Saves the id's of selected items in the hidden field
		var selected_ids = new Array();
		selectable_list.find("select.selectablelistright option").each(function(){
			selected_ids.push($(this).val());
		});
		selectable_list.find('input.selectablelist_ids').val(selected_ids.join(','));
		
		// to remove items not matching filter
		$('.selectabletext').autocomplete("search");
	});
	
	// TODO: Enable/disable add buttons if left options (not) selected
	
	// TODO: Enable/disable remove buttons if right options (not) selected
	
	// TODO: On form submit, deselect/disable all items in the selects
	
	$('.selectabletext').autocomplete({
		minLength: 0,
		source: "/players/autocomplete_player_given_name",
		focus: function(event, ui) { return false; },
		select: function( event, ui ) { return false; }
	})	
	.data( "autocomplete" )._response = function( items ) {
		// From original
	    if ( items.length ) {
	        items = this._normalize( items );
		}	
		// Empty match list and refill with response items
		match_select = $("select.selectablelistleft");
		match_select.empty();
		$.each(items, function(index, item){
			match_select.
		        append($("<option></option>").
		        attr("value",item.id).
		        text(item.value));
		});	
		
		// Ensures selected items don't appear in the match list
		$("select.selectablelistright option").each(function(index, item){
			match_select.find("option[value='" + $(this).val() + "']").remove();
		});
	};
	
});
