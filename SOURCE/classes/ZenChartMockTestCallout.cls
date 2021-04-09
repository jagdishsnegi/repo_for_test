@isTest
global class ZenChartMockTestCallout {
    
    global testMethod static void OpportunityHandler(){
        
        
        Account ac = new Account(Name='test');
        insert ac;
        List<Opportunity> OpList =new List<Opportunity>();
        Opportunity o = new Opportunity(AccountId=ac.id, CloseDate=system.today(),Name='Test Opp',StageName='Active');
       
        insert o;
        o.stageName='Pending Admission';
        update o;
        string payload='id='+EncodingUtil.urlEncode(o.id,'UTF-8')+'&event='+EncodingUtil.urlEncode('client.create','UTF-8')+'&Patient='+EncodingUtil.urlEncode(o.AccountId,'UTF-8');
         testAccessTokenCallout(payload);
          
        
    }
     public static void testAccessTokenCallout(string payload) {
// Set mock callout class 
  
     Test.setMock(HttpCalloutMock.class, new ZenChartCalloutRequestTest());

Test.startTest();
        Http http=new Http();
        HttpRequest req=new HttpRequest();
        req.setEndpoint('https://ir.zencharts.com/v3/other/integration/hook/salesforce');
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/x-www-form-urlencoded'); 
        
        //string payload='id='+EncodingUtil.urlEncode('0062h000005SKx6AAG','UTF-8')+'&event='+EncodingUtil.urlEncode('client.create','UTF-8')+'&Patient='+EncodingUtil.urlEncode('0012h000006hCL8AAM','UTF-8');
        req.setBody(payload);
        HttpResponse response=http.send(req); 
         System.assertEquals(200, response.getStatuscode());
  test.stopTest();      



}

}