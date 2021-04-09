global class ZenChartCalloutRequestTest implements HttpCalloutMock {
   
      
    global  HTTPResponse respond(HTTPRequest req) {
     
     // Create a fake response (first mock is access_token, second mock is client id)
    HttpResponse res = new HttpResponse();
    res.setHeader('Content-type', 'application/x-www-form-urlencoded');
    string payload='id='+EncodingUtil.urlEncode('0062h000005SKx6AAG','UTF-8')+'&event='+EncodingUtil.urlEncode('client.create','UTF-8')+'&Patient='+EncodingUtil.urlEncode('0012h000006hCL8AAM','UTF-8');
    res.setBody(payload);
    res.setStatusCode(200);

    return res;
}
   

}