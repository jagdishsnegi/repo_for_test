public class PreAssesment_SHA_PTH_MH_TH {
@AuraEnabled
    public static void saveSubsanceAbuseHistoryRecords(List<Substance_Abuse_History__c> Records){
        System.debug('Subsance Abuse History Records-->'+Records);        
        Insert Records;
    }
    
    @AuraEnabled
    public static void saveSMedicalHistoryRecords(List<Medication_History__c> Records){
        System.debug('Medical History Records---->'+Records);        
        Insert Records;
    }
   @AuraEnabled
    public static List<List<string>> getPickListValuesforMedication(){
        
        List<List<string>> masterList=new List<List<string>>();
        List<string> options=new List<string>();
        Schema.DescribeFieldResult fieldResult = Medication_History__c.Name_of_the_Medication__c.getDescribe();
         List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple)
        { 
            options.add( f.getValue());
      
        }    
        masterList.add(options);
        return masterList;
        
    }
    @AuraEnabled        
    public static List<List<String>> getPickListValuesIntoListforSAH()
    {
       List<List<string>> masterList = new List<List<string>>();
        List<string> options = new List<string>();
         List<string> options2 = new List<string>();
         List<string> options3 = new List<string>();
        
       
        //String a= 'Primary_Drug_Type__c';
         Schema.DescribeFieldResult fieldResult = Substance_Abuse_History__c.Drug__c.getDescribe();
         Schema.DescribeFieldResult fieldResultsub = Substance_Abuse_History__c.Method__c.getDescribe();
        // Schema.DescribeFieldResult Frequency = Substance_Abuse_History__c.Frequency__c.getDescribe();
           // system.debug('Frequency--->'+Frequency);    
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry f : ple)
        { 
            options.add( f.getValue());
      
        }    
        masterList.add(options);
        
          List<Schema.PicklistEntry> plesub = fieldResultsub.getPicklistValues();
        for( Schema.PicklistEntry fsub : plesub)
        {
            
            options2.add( fsub.getValue());
           
        }     
       masterList.add(options2);
  
       /** List<Schema.PicklistEntry> plesubnext = Frequency.getPicklistValues();
        for( Schema.PicklistEntry ff : plesubnext)
        {
            
            options3.add( ff.getValue());
           
        }     
        masterList.add(options3);
         system.debug('masterList--->'+masterList); **/
  
        return masterList;
   
    }
}