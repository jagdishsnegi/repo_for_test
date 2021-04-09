//FetchAccountNameForReadmitOpty_Test is test class name
public class FetchAccountNameForReadmitOppty {
    @auraEnabled   
    public static List<Opportunity> getAccountList(string recordId){
        
        List<Opportunity> acclist=[select Account.name,Account.id,Callout_sent__c,AccountID,StageName from opportunity where id=:recordId];
        
        List<Opportunity> NewList=[select id,Admission__c,Callout_sent__c,Account.id,AccountID from Opportunity Where AccountID=:acclist[0].AccountID and Callout_sent__c=true ORDER BY CreatedDate DESC ];
        system.debug('opportunity'+NewList);
        
        system.debug('new are same'+acclist[0].id);
        system.debug('old are same'+NewList[0].id);

        Account a=new Account();
        
        if(acclist[0].Callout_Sent__c==false){
            acclist[0].addError('Error');
        }
        
        else{
            if(acclist[0].id!=NewList[0].id){
            acclist[0].addError('Error');
          }
        
            For(Opportunity o: acclist){
                
                a.id=o.accountId;
                a.Is_ReAdmit__c=true;
                a.Is_Alumni__c=false;
                
            }
            system.debug('account'+a.Is_ReAdmit__c);
            update a;
            
            
        }
        return acclist;
    }
    
}