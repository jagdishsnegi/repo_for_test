({
    createObjectData: function(component, event) {
      
       var Id = component.get("v.recordId");
        var RowItemList = component.get("v.SahList");
        RowItemList.push({
            'sobjectType': 'Medication_History__c',
            'Name_of_the_Medication__c': '',
            'Date_of_Last_Use__c': '',
            'Dosage__c' : '',
            'Frequency__c' : '',
            'Length_of_Prescription__c': '',
            'Current_Compliance__c':'',
            'Current_Compliance_explanation__c':'',
            'Pre_Assessment__c' : Id
        });

 

        component.set("v.SahList", []);      
        component.set("v.SahList", RowItemList);
        
        
        
    },
    
  
     showToast: function(message){
        var toastEvent = $A.get("e.force:showToast");
        if(toastEvent){
            toastEvent.setParams({
                "title": "Notification!",
                "message": message,
                "type": "info"
            });
            toastEvent.fire();
        }
    },

 

 
    validateRequired: function(component, event, helper) {
       var message='';
        console.log('inside validate');
       
        var isValid = true;
        var allContactRows = component.get("v.SahList");
        for (var indexVar = 0; indexVar < allContactRows.length; indexVar++) {
            if (allContactRows[indexVar].Name_of_the_Medication__c == '') {
                
                isValid = false;
               message='Please fill Medication Name Type on row '+(indexVar+1);
                    var toastEvent = $A.get("e.force:showToast");
        if(toastEvent){
            toastEvent.setParams({
                "title": "Notification!",
                "message": message,
                "type": "info"
            });
            toastEvent.fire();
            break;
        }
              console.log('message-->'+message);
         
             // alert('Please fill Primary Drug Type on row ' + (indexVar + 1));
            }
           
             
        }
      //  helper.showToast(message);
   
        console.log('value of isValid'+isValid);
        return isValid;
    },
})