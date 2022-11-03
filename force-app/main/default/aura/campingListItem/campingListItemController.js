({
	packItem : function(component, event, helper) {
		var a = component.get(v.item);
        a.Packed__c = true;
        component.set("v.item",a);
        
        var button = event.getSource();
        document.getElementById(button.id).disabled=true;
	}
    
})