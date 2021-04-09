({
    createObjectData: function(component, event) {
       var Id = component.get("v.recordId");
        var RowItemList = component.get("v.PthList");
        RowItemList.push({
            'sobjectType': 'Treatment_History__c',
            'Facility__c': '',
            'Level_Of_Care__c': '',
            'Length_of_Stay__c' : '',
            'Length_of_Sobriety_Achieved__c' : '',
            'Type_of_Discharge__c': '',
            'Date_of_Episode__c':'',
            'Pre_Assessment__c' : Id
        });
      
       
        
        component.set("v.PthList", []);      
        component.set("v.PthList", RowItemList);
        
          //      alert(JSON.stringify(component.get("v.contactList")));
        
    },
  
    validateRequired: function(component, event) {
        console.log('inside validate');
       var message= '';
        var isValid = true;
        var allContactRows = component.get("v.PthList");
        for (var indexVar = 0; indexVar < allContactRows.length; indexVar++) {
            if (allContactRows[indexVar].Facility__c == '') {
             
                isValid = false;
                   message = 'Please fill Name of facility on row ' + (indexVar + 1);
                 var toastEvent = $A.get("e.force:showToast");
        if(toastEvent){
            toastEvent.setParams({
                "title": "Notification!",
                "message": message,
                "type": "info"
            });
            toastEvent.fire();
            break;
              //  alert('Please fill Nmae of facility on row  ' + (indexVar + 1));
            }
           
             
        }
        
             if (allContactRows[indexVar].Level_of_Care__c == '') {
             
                isValid = false;
                   message = 'Please fill Level of care on row ' + (indexVar + 1);
                 var toastEvent = $A.get("e.force:showToast");
        if(toastEvent){
            toastEvent.setParams({
                "title": "Notification!",
                "message": message,
                "type": "info"
            });
            toastEvent.fire();
            break;
              //  alert('Please fill Nmae of facility on row  ' + (indexVar + 1));
            }
           
             
        }
            
            
         //  helper.showToast(message);
      
        }
        
        
        console.log('value of isValid'+isValid);
        return isValid;
    },
})