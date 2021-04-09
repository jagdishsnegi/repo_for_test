//FetchPayerData_test is test class
public class FetchPayerData {

    @auraEnabled
    public static  Payor__c getPayerDataWithValue(String providerId){
        List<Payor__c> payerData = new List<Payor__c>();
        if(String.isNotBlank(providerId)){
            payerData = [SELECT Id, Name, Allowable_PHP__c, 
                                    Allowable_IOP__c, Allowable_detox__c,Allowable_ITR__c,Allowable_OP__c,Allowable_RTC__c FROM Payor__c where Id =:providerId];
        }
        return payerData[0];
    }
    @auraEnabled
    public static void insertInsuranceData(string ids, Decimal IR, Decimal PR){
        
       
        VOB__c v=new VOB__c(id=ids);
        
        v.Insurance_Responsibility__c=IR;
        v.Patient_Responsibility__c=PR;
        
        system.debug('beforeupdate'+v);
        update v;
        system.debug('afterupdate'+v);
        
    }
}