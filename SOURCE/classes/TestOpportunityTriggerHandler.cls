@istest
public class TestOpportunityTriggerHandler {
 
static testMethod void testEx(){
        
Test.startTest();
        
 Account a = new Account(
 Name ='test 1', Industry='Academia', BillingCountry='United States');
 insert a; 
 Opportunity o1=new Opportunity(AccountId=a.id,closedate=system.today(),stagename='Active',Name='Test') ;
 insert o1;
    
 Opportunity clonedop = o1.clone(false, false, false, false);
 List<Opportunity> cloneList=new List<Opportunity>();
 cloneList.add(clonedop);
 insert clonedop; //this will fire your trigger

 OpportunityTriggerHandler.opprecord(cloneList);
Test.stopTest();
  }
static testMethod void testEx1(){
        
Test.startTest();
        
 Account a = new Account(
 Name ='test 1', Industry='Academia', BillingCountry='United States');
 insert a; 
 Opportunity o1=new Opportunity(AccountId=a.id,closedate=system.today(),stagename='Active',Name='Test',DC_Date__c=system.today()) ;
 insert o1;
    
 Opportunity clonedop = o1.clone(false, false, false, false);
 List<Opportunity> cloneList=new List<Opportunity>();
 cloneList.add(clonedop);
 insert clonedop; //this will fire your trigger

 OpportunityTriggerHandler.updateDischargeDate(cloneList);
Test.stopTest();
  }
}