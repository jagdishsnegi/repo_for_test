/**
 * PreAssesment export as pdf test class
 * 
 **/
@istest
public class PdfHealperTest {

     @isTest
    static void testgetmeth1()
    {
         Account a  = new Account(Name='TestAccount');
         insert a;
        Opportunity o = new Opportunity();
        o.Name='Test';
        o.AccountId=a.Id;
        o.CloseDate=Date.today();
        o.StageName='VOB in Progress';
        insert o;
        PreAssesment__c p = new PreAssesment__c(Patient_Name__c=o.Id);
        insert p;
        Substance_Abuse_History__c s=new Substance_Abuse_History__c();
        s.Drug__c='Alcohol';
        s.Last_Use__c=System.today();
        s.Daily_Amount__c='two';
        s.Pre_Assessment__c=p.Id;
        s.Method__c='oral';
        s.Age_of_first_use__c='a';
        s.Frequency__c='Daily';
        insert s;
        
    Test.startTest();
    PdfHelper.getmeth1();
    Test.stopTest();
        
     PageReference pref = Page.PreAssesment_ExportAsPdf;
     pref.getParameters().put('id', p.id);
    Test.setCurrentPage(pref);

    ApexPages.StandardController sc = new ApexPages.StandardController(p);

    PdfHelper mc = new PdfHelper(sc);
        
    }

    
    
    
    @isTest
    static void testgetmeth2()
    {
        Account a  = new Account(Name='TestAccount');
    insert a;
    Opportunity o = new Opportunity();
        o.Name='Test';
        o.AccountId=a.Id;
        o.CloseDate=Date.today();
        o.StageName='VOB in Progress';
         insert o;
         PreAssesment__c p = new PreAssesment__c(Patient_Name__c=o.Id);
         insert p;
        Medication_History__c md=new Medication_History__c();
        md.Pre_Assessment__c=p.Id;
        md.Date_of_Last_Use__c=System.today();
        md.Frequency__c='one';
        md.Current_Compliance__c='explain';
        md.Length_of_Prescription__c='Two';
        md.Dosage__c='one';
        insert md;
        
    Test.startTest();
    PdfHelper.getmeth2();
    Test.stopTest();
        
    PageReference pref = Page.PreAssesment_ExportAsPdf;
    pref.getParameters().put('id', p.id);
    Test.setCurrentPage(pref);

    ApexPages.StandardController sc = new ApexPages.StandardController(p);

    PdfHelper mc = new PdfHelper(sc);
        
    }
    
    @isTest
    static void testgetmeth3()
    {
        Account a  = new Account(Name='TestAccount');
        insert a;
        Opportunity o = new Opportunity();
        o.Name='Test';
        o.AccountId=a.Id;
        o.CloseDate=Date.today();
        o.StageName='VOB in Progress';
        insert o;
        PreAssesment__c p = new PreAssesment__c(Patient_Name__c=o.Id);
        insert p;
        Treatment_History__c th=new Treatment_History__c();
        th.Level_Of_Care__c='Detox';
        th.Facility__c='a';
        th.Length_of_Sobriety_Achieved__c='one';
        th.Type_of_Discharge__c='Completion';
        th.Pre_Assessment__c=p.Id;
        th.Length_of_Stay__c='one';
        insert th;
        
    Test.startTest();
    PdfHelper.getmeth3();
    Test.stopTest();
        
    PageReference pref = Page.PreAssesment_ExportAsPdf;
    pref.getParameters().put('id', p.id);
    Test.setCurrentPage(pref);

    ApexPages.StandardController sc = new ApexPages.StandardController(p);

    Pdfhelper mc = new Pdfhelper(sc);
        
    }

}