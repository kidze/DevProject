({
	createItem : function(component, newItem) {
		var action = component.get("c.saveItem");
        action.setParams({
			"item":newItem
		});
		action.setCallBack(this, function(response){
			var state = response.getState();
			if(state === "SUCCESS"){
				var items = component.get("v.items");
				items.push(newItem);
				component.set("v.items",items);
			}
		});
        
			
	}
})