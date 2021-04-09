({
    createObjectData: function(component, event) {
      
       var Id = component.get("v.recordId");
        var RowItemList = component.get("v.SahList");
        console.log('RowItemList ',RowItemList);
        RowItemList.push({
            'sobjectType': 'Substance_Abuse_History__c',
            'Drug__c': '',
            'Method__c': '',
            'Last_Use__c' : '',
            'Daily_Amount__c' : '',
            'Frequency__c' : '',
            'Age_of_first_use__c': '',
            'Pre_Assessment__c' : Id
        });

 
		console.log('RowItemList ',RowItemList);
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
            if (allContactRows[indexVar].Drug__c == '') {
                
                isValid = false;
               message='Please fill Drug Type on row '+(indexVar+1);
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