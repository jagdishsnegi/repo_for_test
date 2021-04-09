({
    CheckEditMode : function(component, event, helper) {
        var isInEditMode = component.get("v.isInEditableMode");
        if(!isInEditMode){
            component.set("v.isInEditableMode",true);
            component.set("v.isEdit",true);
        }
        else{
            component.set("v.isInEditableMode",false);
            component.set("v.isEdit",false);
        }
       
    },
    estimatedReimbursement: function (component, event, helper) {
        event.preventDefault(); //Prevent default submit
        var eventFields = event.getParam("fields"); //get the fields
        var providervalue =  eventFields['Insurance_Provider_lookup__c'];
        helper.getPayerDataWithValue(component, event, helper,providervalue,eventFields);
     
    },
    
     closeModel: function(component, event, helper) {
      // for Hide/Close Model,set the "isOpen" attribute to "Fasle"  
      component.set("v.isOpen", false);
   },
   
    Freeze: function(component, event,helper){
       var id=component.get('v.recordId');
        
        var PR=component.get('v.Patient');
        var IR=component.get('v.Insurance');
        
        console.log('IR/PR'+IR+' '+PR);
        var action=component.get('c.insertInsuranceData');
        action.setParams ({
            ids:id,
            IR:IR,
            PR:PR
        });
         component.set("v.isOpen", false);
       
        action.setCallback(component,function(response){
              
            var state=response.getState();
            if(state=='SUCCESS'){
               var toastEvent = $A.get("e.force:showToast");
                 toastEvent.setParams({
                "type" : "Success",
                "title": "Success!",
                "message": "Calculation Freezed!"
                   
            });
              toastEvent.fire();
             
              
                 
              $A.get('e.force:refreshView').fire(); 
            }
        
             });
        $A.enqueueAction(action);
    },
   
});