trigger TriggerOnOpportunityForZenchartCallout on Opportunity(after update) {
    
    if(trigger.isUpdate) {
        if(!System.Isbatch() && !system.isFuture()) {
           if(trigger.new.size() == 1) {
                if(trigger.old[0].stagename!=trigger.new[0].stagename){
                if(trigger.new[0].stageName == 'Pending Admission') {
                    system.debug('Stage is Pending Admission');
                    string OpportunityId = trigger.new[0].id;
                    string Accountids = trigger.new[0].accountId;
                    ZenChartCalloutRequest.ZenInfiniteInvocableMethod(OpportunityId, Accountids);
                }
             }
          }      
        }
    }
    /**
     * check old stage and current and if not equal and if stage current stage is pending admission
     validation method for comparingl old and new map
     **/
}