@istest
public class PreAssesment_TH_Test {

     @isTest
    static void saveSubsanceAbuseHistoryRecords()
    {
        Test.startTest();
        Treatment_History__c ob=new Treatment_History__c();
        List<Treatment_History__c> result=new List<Treatment_History__c>();
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
        ob.Facility__c='LSD';
        ob.Level_Of_Care__c='IOP';
        ob.Length_of_Stay__c='LONG';
        ob.Length_of_Sobriety_Achieved__c='Rare';
        ob.Type_of_Discharge__c='None';
        ob.Date_of_Episode__c =system.today();
            
        result.add(ob);
        PreAssesment_PTH.saveContacts(result);
        Test.stopTest();
    }
    @isTest
    static void TestgetPickListValuesIntoListforSAH()
    {
        Test.startTest();
        Treatment_History__c ob2=new Treatment_History__c();
        ob2.Level_Of_Care__c='IOP';
        ob2.Type_of_Discharge__c='None';
        PreAssesment_PTH.getPickListValuesIntoList();
        Test.stopTest();
    }
}