({
    getPayerDataWithValue: function(component, event, helper,providervalue,eventFields){
        
        console.log('provderValue' +JSON.stringify(providervalue));
        console.log('eventFields' +JSON.stringify(eventFields));
        
        component.set("v.isOpen", true);//modal opening
        var action = component.get("c.getPayerDataWithValue");
        action.setParams ({ providerId : providervalue });      
        
        action.setCallback(component,function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('res '+JSON.stringify(response.getReturnValue()));
                component.set('v.JSONList',response.getReturnValue());
                var etr= helper.calculateETR(component, event, helper,response.getReturnValue(),eventFields)
                console.log('value'+etr);
                if($A.util.isUndefinedOrNull(etr)){
                   // eventFields["Insurance_Responsibility__c"]=0;
                   // eventFields["Patient_Responsibility__c"]=0;
                   component.set("v.Patient",0);
                   component.set("v.Insurance",0); 
                }
                else{
                   //eventFields["Insurance_Responsibility__c"] = etr[1];
                   //eventFields["Patient_Responsibility__c"]= etr[0];
                   component.set("v.Patient",etr[0]);
                   component.set("v.Insurance",etr[1]); 
                }
                component.find('ETRForm').submit(eventFields); //Submit Form
                
                component.set("v.isEdit",false);
            }          
        });
        $A.enqueueAction(action);
    },
    
    calculateETR: function(component, event, helper,payorDetails,eventFields){
      
    if(!$A.util.isEmpty(payorDetails) || !$A.util.isUndefinedOrNull(payorDetails)){
        let totalDetox  = Number(eventFields["Detox__c"]*payorDetails["Allowable_Detox__c"]);
        let totalITR = Number(eventFields["IPR__c"]*payorDetails["Allowable_ITR__c"]);
        let totalRTC = Number(eventFields["RTC__c"]*payorDetails["Allowable_RTC__c"]);
        let totalPHP = Number(eventFields["PHP__c"]*payorDetails["Allowable_PHP__c"]);
        let totalIOP = Number(eventFields["IOP__c"]*payorDetails["Allowable_IOP__c"]);
       
        let coInsurance = Number(eventFields["Co_Insurance__c"]/100.0);
        let deductibles= Number(eventFields["Deductible__c"]);
        let OOP=Number(eventFields["OOP__c"]);
        
        if($A.util.isEmpty(totalDetox)  && $A.util.isEmpty(totalITR)  && 
           $A.util.isEmpty(totalPHP) && $A.util.isEmpty(totalIOP) &&$A.util.isEmpty(totalRTC)&&$A.util.isEmpty(OOP)){
            return undefined;
           
        }
        else{
            var listOfValues=[];
            var TotalPR;
            let TotalFlatCharges = (totalDetox+totalITR+totalPHP+totalRTC+totalIOP)
            let PRwithDeductibles= TotalFlatCharges*coInsurance+deductibles;
            if(OOP<PRwithDeductibles){
                TotalPR=OOP;
                listOfValues.push(TotalPR);
            }
            else {
                TotalPR=PRwithDeductibles;
                listOfValues.push(TotalPR);
            }
           
            let TotalIR=TotalFlatCharges-TotalPR;           
            listOfValues.push(TotalIR);
            console.log(listOfValues);
            
            return listOfValues;
        }
    } 
},
  
 
 
    
})