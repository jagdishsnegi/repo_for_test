@istest
public class PreAssesment_SHA_Test {
   @isTest
    static void saveSubsanceAbuseHistoryRecords()
    {
        Test.startTest();
        Substance_Abuse_History__c ob=new Substance_Abuse_History__c();
        List<Substance_Abuse_History__c> result=new List<Substance_Abuse_History__c>();
        Account ac=new Account();
            
        ac.Name='Mr. ab bc cd';
        insert ac;
         Opportunity op=new Opportunity();
         op.Name='av';
      
         op.CloseDate=System.today();
        op.StageName='Active';
        op.AccountId=ac.Id;
        insert op;
        PreAssesment__c ob1=new PreAssesment__c();
        ob1.Patient_Name__c=op.Id;
        insert ob1;
        ob.Drug__c='LSD';
        ob.Method__c='Oral';
        ob.Last_Use__c=system.today();
        ob.Daily_Amount__c='Rare';
        ob.Frequency__c='Daily';
        ob.Age_of_first_use__c ='Detox';
            
        result.add(ob);
        PreAssesment_SHA_PTH_MH_TH.saveSubsanceAbuseHistoryRecords(result);
        Test.stopTest();
    }
    @isTest
    static void TestgetPickListValuesIntoListforSAH()
    {
        Test.startTest();
        Substance_Abuse_History__c ob2=new Substance_Abuse_History__c();
        ob2.Drug__c='LSD';
        ob2.Method__c='Oral';
       // ob2.Frequency__c='Daily';
        PreAssesment_SHA_PTH_MH_TH.getPickListValuesIntoListforSAH();
        Test.stopTest();
    }
     @isTest
    static void TestgetPickListValuesIntoListforMH()
    {
        Test.startTest();
        Medication_History__c ob2=new Medication_History__c();
        ob2.Name_of_the_Medication__c='Detox';
      
       // ob2.Frequency__c='Daily';
        PreAssesment_SHA_PTH_MH_TH.getPickListValuesforMedication();
        Test.stopTest();
    }
    
}