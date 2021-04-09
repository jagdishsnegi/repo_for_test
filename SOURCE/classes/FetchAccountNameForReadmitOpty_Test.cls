@istest
public class FetchAccountNameForReadmitOpty_Test {

    public static testmethod void fetchaccountName(){
        
        test.startTest();
        Account a=new Account(name='TEST');
        insert a;
        Opportunity oppt=new Opportunity(stageName='Active',CloseDate=system.today(),AccountId=a.id,Name='TestOpt',Callout_Sent__c=true);
        insert oppt;
        FetchAccountNameForReadmitOppty.getAccountList(oppt.id);
        test.stopTest();
    }
}