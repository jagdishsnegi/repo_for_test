@istest
public class FetchPayerDataTest {

    @istest(seealldata=true)
    static void PayorDataTest(){
        List<Payor__c> Plist=[select id,name from Payor__C Limit 1];
        Payor__c p=new Payor__c();
        insert p;
        FetchPayerData.getPayerDataWithValue(p.id);
    }
    public testMethod static void UpdateVob(){
      test.startTest();
        Payor__c p=new Payor__c();
        insert p;
        VOB__c v=new VOB__c();
      insert v;
        Decimal d=1.0;
        Decimal i=2.0;
        v.Insurance_Responsibility__c=d;
        v.Patient_Responsibility__c=i;
        update v;
        test.stopTest();
        FetchPayerData.insertInsuranceData(v.id, d, i);
    }
}