public class OpportunityTriggerHandler {
    public static void opprecord(List<Opportunity> opp){
        try{
            system.debug('inside try');
            Set<id> opids=new Set<id>();
            Set<id> acIds=new Set<id>();    
            for(Opportunity o:opp){
                opids.add(o.id);
                acIds.add(o.AccountId);
            }
            //Naming Convension change
            List<Opportunity> OppList=[Select id,Name,AccountId,Admission__c from Opportunity where id IN: opids];
            system.debug('olist'+OppList);    
            List<Account> LastOpportunityOnAccount =[Select id,Name,(select id,name,accountId from opportunities ORDER BY createddate desc LIMIT 2) from Account where id in:acIds];
            // List<Opportunity> copyfrom=[select id,name,accountId,Admission__c from opportunity where accountID IN:acIds ORDER BY createdDate Desc LIMIT 2];
            system.debug('list of acc'+LastOpportunityOnAccount);
                        
            for(Account a:LastOpportunityOnAccount){
                for(opportunity o: a.opportunities){ 
                    OppList[0].Admission__c=o.id;
                    OppList[0].callout_sent__c=false;
                     OppList[0].Zenchart_Callout_Response__c='';
                }
                
            }
            system.debug(LastOpportunityOnAccount);
            update OppList;
            
        }
        catch(Exception e){
            system.debug('get message'+e.getMessage());
        }
    }
    public static void updateDischargeDate(list<Opportunity> oppwithdischargeDate){
        
        try{
        system.debug('Opplist '+oppwithdischargeDate);
        set<Id> Accid=new Set<id>();
        for(Opportunity opp:oppwithdischargeDate){
            Accid.add(opp.AccountId);
        }
        List<Opportunity> ChildUpdateList=[select id, DC_Date__c, Type__c,AccountId from opportunity where accountid in :Accid and stagename='Admitted'];
        system.debug('All opportunity'+ChildUpdateList);
        List<Opportunity> oplist1=new List<opportunity>();
        
        for(Opportunity op:oppwithdischargeDate){
            for(Opportunity opp:ChildUpdateList){
                opp.DC_Date__c=op.DC_Date__c;
                opp.type__c=op.Type__c;
                oplist1.add(opp);
            }
        }
            if(oplist1.size()>0){    
                update oplist1;
            }
            system.debug('Updated list'+oplist1);
        }
        catch(exception e){
            system.debug('error'+e.getMessage());
        }
    }
    
}