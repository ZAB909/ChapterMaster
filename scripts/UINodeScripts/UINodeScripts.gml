// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//enums in GML are global regardless of where they are declared, but declaring it here for clarity
		
enum UINODE_STATUS {
	//First three map to same return codes as rect in rect test
	OUTSIDE_OF_RECT,
	SUCCESS,
	EDGE_OVERLAPS,
	SAME_SIZE_AS_CHILD,
	ENCOMPASES_CHILD,
	CRITICAL_ERROR
}


function UINode(gui_x, gui_y, width, height, padding = 0, margin = 0) constructor {

	self.gui_x = gui_x;
	self.gui_y = gui_y;
	self.width = width
	self.height = height
	self.padding = padding; //currently unused
	self.margin = margin //currently unused
	components = []
	children = [];
	creator = other;
	is_active = true;
	static make_id = function() {
		static base = 0;
		return "UINode" + string(base++)
	}
	gid = make_id()

	static is_in_bounding_rect = function(px, py) {
		return point_in_rectangle(px, py, gui_x, gui_y, width + gui_x, height + gui_y)
	}
	
	static set_name = function(name) {
		gid = name;	
		return self;
	}
	
	static get_component_type = function(component) {
		
		static reduction = function(prev, curr) {
			if is_instanceof(prev, NullComponent) {
				return is_instanceof(curr, component) ? curr : prev;
			}
			return prev
		}
		
		if is_callable(component) {
			return array_reduce(components, method({component}, reduction), new NullComponent())
		}
		throw "UI: get_component method requires passing in a constructor function to find the component"
	}
	
	/**
	 * Function Description
	 * @param {function.UIComponent} component Description
	 */
	static add_component = function(component, name = undefined) {
		if is_callable(component)
			array_push(components, new component(self, name))
		return array_last(components)
	}

	static remove_component = function(component) {
		static filter = function(elem) {
			return elem != component
		}
		components = array_filter(components, method({component}, filter))
	}
	
	/**
	 *  Adds an existing UI node to this node in the UI graph. Can automatically be added to a child node if it would fit within that child element
	 * @param {struct.uinode} ui_node  An existing UI node to add to this UI graph
	 * @param {bool} [allow_child_insertion]=true  default true: Whether the added node should be added to a child node or only the root
	 * @param {array} [callstack]=[] internal use only...
	 * @returns {struct.UINode}  blah
	 */	
	static add_child_from_existing = function(ui_node, allow_child_insertion = true) {
		array_push(children, ui_node)
		return self;
	}
	
	static add_child = function(x, y, width, height, padding = 0, allow_child_insertion = true) {
		var new_node = new UINode(x + gui_x, y + gui_y, width, height)
		add_child_from_existing(new_node, allow_child_insertion)
		return new_node;
	}
	
	/// @desc Function Description
	/// @returns {Id.Instance|struct.UINode}
	static finalize = function() {
		if is_struct(creator) {
			if is_instanceof(creator, UINode) {
				return creator;
			}
		}
		return self;
	}

	static render = function(_x = 0, _y = 0) {
		var render_components = array_filter(components, function(elem) {
			return is_instanceof(elem, UIRenderComponent)
		})
		array_foreach(render_components, function(elem) {
			elem.render(gui_x, gui_y)
		})
		array_foreach(children, function(elem) {
			elem.render();
		})
	}
	
	static remove_child_by_name = function(name) {
		var new_array = array_filter(children, method({name}, function(elem) {
			return elem.gid != name	
		}))
		children = new_array
	}
	
	static remove_child = function(val) {
		var new_array = array_filter(children, method({val}, function(elem, idx){
			return 	idx != val;
		}))
		children = new_array;
	}
	
	static destroy_components = function() {
		array_foreach(components, function(elem) {
			if 	is_instanceof(elem, UIEventComponent)
				elem.cleanup()
		})
		components = [];
	}
}