({
 
    // function call on component Load
    doInit: function(component, event, helper) {
        
        helper.createObjectData(component, event);
        var action = component.get("c.getPickListValuesIntoList");
          action.setCallback(this,function(response){
              
            var data=response.getReturnValue();
            
               component.set("v.PrimaryPickListValues",data[0]); 
              component.set("v.TypeOfDischargeList",data[1]); 
             
              });
  $A.enqueueAction(action);
    },
 
   
    Save: function(component, event, helper) {
        console.log('inside save');
          console.log('action-->');
        
       if (helper.validateRequired(component, event)) {
            console.log('PUSH FUNCTIONALITY'); 
        var Id = component.get("v.recordId");
        component.set("v.PthList.Pre_Assessment__c",Id);
        //console.log('sah lkup id'+component.get("v.PthList.Pre_Assessment__c"));
        //console.log('recordId-->'+Id);
        ///console.log('contact list value'+JSON.stringify(component.get("v.SahList")))
           var action = component.get("c.saveContacts");
    
            action.setParams({
                "ListPTH": component.get("v.PthList")
            });
            
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                         component.set("v.PthList", []);
                    helper.createObjectData(component, event);
                    
                }
                 $A.get("e.force:closeQuickAction").fire(); 
                var toastEvent = $A.get("e.force:showToast");
    toastEvent.setParams({
        "type" : "Success",
        "title": "Success!",
        "message": "PREVIOUS TREATMENT HISTORY ADDED SUCCESSFULLY!."
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
        console.log('event ctarget'+ctarget);
       var index = ctarget.dataset.value;
       // var index = event.getSource();
         console.log('event index'+index);
        var AllRowsList = component.get("v.PthList");
        AllRowsList.splice(index, 1);
       
        component.set("v.PthList", AllRowsList);
    },
})