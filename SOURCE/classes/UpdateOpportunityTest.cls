@istest
public class UpdateOpportunityTest {

 public static testMethod void Vob1(){
          Account a  = new Account(Name='Test');
          insert a;
          Opportunity o = new Opportunity(Name='TestOpp',StageName='Active',CloseDate=System.today(),AccountId=a.Id);
          insert o;
          Contact c = new Contact(LastName='TestContact',AccountId=a.Id);
          insert c;
          Test.startTest();
     
          Lead L12=new Lead(LastName='ab', Status='Active',Email='mitali@xyz2.com',Client_Last_Name__c='Pandey',
                            Has_Insurance__c=true,Has_Secondary_Insurance__c=true,LeadSource='Internet',FirstName='U',MiddleName='K',
                
                            Street='N',State='Alaska',City='G',PostalCode='20130',Country='United States');
     
          insert L12;
          L12.FirstName='ab';
     
           update L12;
     
       Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(L12.Id);
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        system.debug('convertsted  :-->'+convertStatus);
        lc.setConvertedStatus(convertStatus.MasterLabel);   
        Database.LeadConvertResult lcr = Database.convertLead(lc);
      
        system.assert(lcr.isSuccess());
    Test.stopTest();
     
  }
public static testMethod void Vob2(){
          Account a  = new Account(Name='Test');
          insert a;
          Opportunity o = new Opportunity(Name='TestOpp',StageName='Active',CloseDate=System.today(),AccountId=a.Id);
          insert o;
          Contact c = new Contact(LastName='TestContact',AccountId=a.Id);
          insert c;
          Test.startTest();
          Lead L12=new Lead(LastName='ab', Status='Active',Email='mitali@xyz2.com',Client_Last_Name__c='Pandey',
                            Has_Insurance__c=false,Has_Secondary_Insurance__c=false,LeadSource='Internet',FirstName='U',MiddleName='K',
                           Street='N',State='Alaska',City='G',PostalCode='20131',Country='United States');
          insert L12;
          L12.FirstName='ab';
           update L12;

       Database.LeadConvert lc = new Database.LeadConvert();
        lc.setLeadId(L12.Id);
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        system.debug('convertsted  :-->'+convertStatus);
        lc.setConvertedStatus(convertStatus.MasterLabel);   
        Database.LeadConvertResult lcr = Database.convertLead(lc);
      
        system.assert(lcr.isSuccess());
         Test.stopTest();
       
  }

}