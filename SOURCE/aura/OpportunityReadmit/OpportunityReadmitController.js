({
    doInit : function(component, event, helper) {
        var recordid = component.get("v.recordId");
        //alert(recordid);
        
        var action = component.get("c.getAccountList");
        
        action.setParams({"recordId":recordid});
        action.setCallback(this,function(response){
            var state=response.getState();
            
            if(state=='ERROR'){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "type" : "Error",
                    "title": "Error!",
                    "message": "Please Re-admit using latest Admission."
                    
                });
                toastEvent.fire();
                $A.get("e.force:closeQuickAction").fire();  
                
            }
            if(state=='SUCCESS'){
                var namel=response.getReturnValue();
                console.log('name '+JSON.stringify(namel));
                // console.log('the name is---' , namel[0].Account.Id);
                var evt = $A.get("e.force:createRecord");
                var stage=component.get("v.simpleRecord.StageName");
                console.log('Stage name is'+stage); 
                
                evt.setParams({
                    'entityApiName':'Opportunity',
                    'defaultFieldValues': {
                        'Name':component.get("v.simpleRecord.Name"),
                        'Admission__c':recordid,
                        'AccountId':namel[0].AccountId,
                        'Client_First_Name__c':component.get("v.simpleRecord.Client_First_Name__c"),
                        'Client_Middle_Name__c' : component.get("v.simpleRecord.Client_Middle_Name__c"),
                        'Client_Last_Name__c':component.get("v.simpleRecord.Client_Last_Name__c"),
                        
                        'Primary_Phone__c' : component.get("v.simpleRecord.Primary_Phone__c"),
                        'Preferred_Name__c' : component.get("v.simpleRecord.Preferred_Name__c"),
                        'Alternate_Phone_No_1__c' : component.get("v.simpleRecord.Alternate_Phone_No_1__c  "),
                        'Client_DOB__c' : component.get("v.simpleRecord.Client_DOB__c"),
                        
                        
                        'Do_Not_Contact__c' : component.get("v.simpleRecord.Do_Not_Contact__c"),
                        'Do_Not_Readmit__c' : component.get("v.simpleRecord.Do_Not_Readmit__c"),
                        'SSN__c' : component.get("v.simpleRecord.SSN__c"),
                        'Marital_Status__c' : component.get("v.simpleRecord.Marital_Status__c"),
                        'Client_Email__c':component.get("v.simpleRecord.Client_Email__c"),
                        'Identifier_Gender__c' : component.get("v.simpleRecord.Identifier_Gender__c"),
                        'Phone_Type__c' : component.get("v.simpleRecord.Phone_Type__c"),
                        'Alternate_Phone_Type__c':component.get("v.simpleRecord.Alternate_Phone_Type__c"),
                        'LOC__c' : component.get("v.simpleRecord.LOC__c"),
                        //Patient Information End's
                        //Address auto populate start's
                        
                        'Street__c':component.get("v.simpleRecord.Street__c"),
                        'State1__c' : component.get("v.simpleRecord.State1__c"),
                        'City__c' : component.get("v.simpleRecord.City__c"),
                        'Country__c':component.get("v.simpleRecord.Country__c"),
                        'Zip__c' : component.get("v.simpleRecord.Zip__c"),
                        //Address Ends here
                        //Required fields
                        'StageName':'Active'
                       // 'CloseDate':component.get("v.simpleRecord.CloseDate"),
                        
                    },
                    
                });
                
                
                evt.fire();
                
                $A.get("e.force:closeQuickAction").fire();  
                
                
            }
            
            
        });
        $A.enqueueAction(action);  
        
        
    },
    
    
})