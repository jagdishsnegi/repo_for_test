global class ZenChartCalloutRequest {
    @future(Callout=true)
    
    public static void ZenInfiniteInvocableMethod(string opportunityId,string accountIds)
    {
        system.debug('oppd'+opportunityId);   
        string payload;
        
        List<Opportunity> listOfOpps=[select id,AccountId,Callout_Sent__c,Admission__c from opportunity where id = :opportunityId];
        List<Account> acclist=[SELECT id,name,
                               (SELECT id,name,stagename 
                                FROM Opportunities 
                                WHERE stagename='Admitted' OR stagename='Alumni-Closed Stage' 
                                ORDER BY createddate desc LIMIT 1) 
                               FROM account where id =:accountIds];
        //Nested query can be replaced by single query with opportunity
        
        system.debug('List of opportunities'+acclist);
        //Patient is admitted for the first time so opportunity size is zero
        if(acclist[0].opportunities.size()==0){ 
            for(Opportunity op:listOfOpps){ 
                payload='id='+EncodingUtil.urlEncode(op.id,'UTF-8')+'&event='+EncodingUtil.urlEncode('client.create','UTF-8')+'&Patient='+EncodingUtil.urlEncode(op.AccountId,'UTF-8');
            }
            system.debug('Admit Payload'+payload);
            CalloutForOpportunityAdmit(payload,opportunityId);
        }
        
        else if(acclist[0].opportunities.size() > 0){
            system.debug('inside re-admit if');
            for(Account a:acclist){
                for(opportunity o:a.opportunities){               
                    payload='id='+EncodingUtil.urlEncode(listOfOpps[0].id,'UTF-8')+'&event='+EncodingUtil.urlEncode('client.readmission.create','UTF-8')+'&prev_admission='+EncodingUtil.urlEncode(listOfOpps[0].Admission__c,'UTF-8');
                } 
            }
            system.debug('Re-Admit Payload'+payload);
            CalloutForOpportunityAdmit(payload,opportunityId);
        }
        
    }
    
    global static void CalloutForOpportunityAdmit(string payload,string oppID){
        try{
            system.debug('Inside Callout try');
            
            Boolean callout=[select id,Callout_Sent__c from opportunity where id=:oppID limit 1].Callout_Sent__c;
            Opportunity oppUpdation = new Opportunity(id=oppID);
            Http http=new Http();
            HttpRequest req=new HttpRequest();
            req.setEndpoint('https://ir.zencharts.com/v3/other/integration/hook/salesforce');
            req.setMethod('POST');
            req.setHeader('Content-type', 'application/x-www-form-urlencoded'); 
            
            //string payload='id='+EncodingUtil.urlEncode('0062h000005SKx6AAG','UTF-8')+'&event='+EncodingUtil.urlEncode('client.create','UTF-8')+'&Patient='+EncodingUtil.urlEncode('0012h000006hCL8AAM','UTF-8');
            req.setBody(payload);
            HttpResponse response=http.send(req);        
            system.debug('response code is:'+response.getStatusCode());
            system.debug('response body'+response.getBody());
            System.debug('complete Response' + response);
            if(response.getStatusCode()==200){
                // Map<String, Object> MapString = (Map<String, Object>) system.JSON.deserializeUntyped(response.getBody());
                string responseFromZenchart=String.valueOf(response.getBody());
                if(responseFromZenchart.containsIgnoreCase('error')){
                    System.debug('Error Response is coming');
                    callout=true;
                    oppUpdation.Callout_Sent__c=callout;
                    oppUpdation.Zenchart_Callout_Response__c=responseFromZenchart;
                }
               Else{
                    callout=true;
                    oppUpdation.Callout_Sent__c=callout;
                    oppUpdation.Zenchart_Callout_Response__c=responseFromZenchart;
                    
                    System.debug('Code is coming');
                }
                update oppUpdation;
                // List<object> objerrorList=(List<Object>)MapString.get('error');
                //system.debug('Error is '+objerrorList);
            }
            
        }
      
        catch(Exception e){
            system.debug('Line no'+e.getLineNumber());
            system.debug('error message'+e.getMessage());
           
        }
        
    }
    
}