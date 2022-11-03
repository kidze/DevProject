/* eslint-disable no-unused-vars */
/* eslint-disable no-console */
({
	doInit : function(component,event,helper){
		var action = component.get("c.getItems");

		action.setCallBack(this, function(response){
			var state = response.getState();
			if(state === "SUCCESS"){
				component.set("v.items",response.getReturnValue());
			}else{
				console.log("Failed with state: "+state);
			}
		});
		$A.enqueueAction(action);
	},
	createItem : function(component, event, helper) {
		var validCamping = component.find('campingform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validCamping){
            // Create the new expense
            var newItem = component.get("v.newItem");
            console.log("Create Item: " + JSON.stringify(newItem));
            helper.createItem(component, newItem);

			
		}
	},

	handleAddItem : function(component,event,helper){
		var item = event.getParam("item");
		var action = component.get("c.saveItem");
		action.setParams({
			"item":item
		});
		action.setCallBack(this,function(response){
			var state = response.getState();
			if(component.isValid() && state === "SUCCESS"){
				var items = component.get("v.items");
				items.push(response.getReturnValue());
				component.set("v.items",items);
			}else{
				console.log("Failed with state: "+state);
			}
		});
		$A.enqueueAction(action);
	}
})