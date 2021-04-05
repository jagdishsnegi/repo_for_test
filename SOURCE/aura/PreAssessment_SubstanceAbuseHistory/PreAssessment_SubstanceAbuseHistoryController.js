({
    // function call on component Load
    doInit: function(component, event, helper) {
        helper.createObjectData(component, event);
        var action = component.get("c.getPickListValuesIntoListforSAH");
        action.setCallback(this,function(response){
            
            var data=response.getReturnValue();
            
            component.set("v.Drug",data[0]);
            component.set("v.Method",data[1]);
            component.set("v.Frequency",data[2]);
            
        });
        $A.enqueueAction(action);
    },
    
    
    Save: function(component, event, helper) {
        console.log('inside save');
        console.log('action-->');
        
        if (helper.validateRequired(component, event)) {
            console.log('PUSH FUNCTIONALITY'); 
            var Id = component.get("v.recordId");
            component.set("v.SahList.Pre_Assessment__c",Id);
            console.log('sah lkup id'+component.get("v.SahList.Pre_Assessment__c"));
            console.log('recordId-->'+Id);
            console.log('contact list value'+JSON.stringify(component.get("v.SahList")))
            var action = component.get("c.saveSubsanceAbuseHistoryRecords");
            
            action.setParams({
                "Records": component.get("v.SahList")
            });
            
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    component.set("v.SahList", []);
                    helper.createObjectData(component, event);
                    
                }
                
                $A.get("e.force:closeQuickAction").fire(); 
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "type" : "Success",
                    "title": "Success!",
                    "message": "SUBSTANCE ABUSE HISTORY ADDED SUCCESSFULLY!."
                });
                toastEvent.fire();
                
                $A.get('e.force:refreshView').fire();
                
            });
            
            $A.enqueueAction(action);
        }
        
        
        
        
    },
    
    
    addNewRow: function(component, event, helper) {
        
        helper.createObjectData(component, event);
    },
    
    removeDeletedRow: function(component, event, helper) {
        
        var ctarget = event.currentTarget;
        var index = ctarget.dataset.value;
        
        var AllRowsList = component.get("v.SahList");
        AllRowsList.splice(index, 1);
        
        component.set("v.SahList", AllRowsList);
    },
})