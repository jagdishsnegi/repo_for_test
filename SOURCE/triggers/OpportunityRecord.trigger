trigger OpportunityRecord on Opportunity (after insert,before update,after update) {
    
    if(trigger.IsAfter && trigger.IsInsert) {
        List<Opportunity> oppList = Trigger.new;
        List<Opportunity> clonnedOppList = new List<Opportunity>();
        for( Opportunity opp : oppList){
            if(opp.isClone()) {
                clonnedOppList.add(opp);   
            }
        }
        if(clonnedOppList.size()>0){
            OpportunityTriggerHandler.opprecord(clonnedOppList);
        }
    }
    if(trigger.IsBefore && trigger.IsUpdate){
        List<Opportunity> Opplist=Trigger.new;
        List<Opportunity> OpWithDCdate=new List<Opportunity>();
        for(Opportunity opp:Opplist) {
            if(opp.DC_Date__c!=null && opp.Type__c!=null ){
                OpWithDCdate.add(opp);
            }
        } 
        if(OpWithDCdate.size()>0){
            OpportunityTriggerHandler.updateDischargeDate(OpWithDCdate);
        }
    }
         
}