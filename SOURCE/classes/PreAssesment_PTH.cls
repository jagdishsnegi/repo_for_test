public class PreAssesment_PTH {

   
   @AuraEnabled
    public static void saveContacts(List<Treatment_History__c> ListPTH){
        Insert ListPTH;
    }
   
    @AuraEnabled       
    public static List<List<String>> getPickListValuesIntoList()
    {
      List<List<string>> masterList = new List<List<string>>();
        List<string> options = new List<string>();
         List<string> options2 = new List<string>();
      
       
        //String a= 'Primary_Drug_Type__c';
        Schema.DescribeFieldResult fieldResult = Treatment_History__c.Level_Of_Care__c.getDescribe();
          Schema.DescribeFieldResult fieldResultsub = Treatment_History__c.Type_of_Discharge__c.getDescribe();
          
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
       
       
       
        return masterList;
    }
}