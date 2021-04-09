public class PdfHelper {
   

public static List<Substance_Abuse_History__c> SubstanceList {get;set;}
    public static List<Medication_History__c> SubstanceList1 {get;set;}
     public static List<Treatment_History__c> TreatmentList {get;set;}



public static String currentRecordId {get;set;}
  //  public static List<Substance_Abuse_History__c> fetchmeth1 {get;set;}
 
    public PdfHelper (ApexPages.StandardController controller) {
    
        currentRecordId  = ApexPages.CurrentPage().getparameters().get('id');
        system.debug('id-->'+currentRecordId  );
 
    }


public static List<Substance_Abuse_History__c> getmeth1() {
//public static List<Substance_Abuse_History__c> fetchmeth1() {

        SubstanceList = new List<Substance_Abuse_History__c>([select id,Drug__c,OwnerId,Last_Use__c,Daily_Amount__c,Pre_Assessment__c,CreatedById,LastModifiedById,Method__c,Name, Age_of_first_use__c,Frequency__c from Substance_Abuse_History__c where Pre_Assessment__c=: currentRecordId]);
        return SubstanceList ;

}
public static List<Medication_History__c> getmeth2() {
//public static List<Substance_Abuse_History__c> fetchmeth1() {

        SubstanceList1 = new List<Medication_History__c>([select id,Pre_Assessment__c,Date_of_Last_Use__c,CreatedById,LastModifiedById,Frequency__c,Current_Compliance__c,Length_of_Prescription__c,Name_of_the_Medication__c,Dosage__c,Name from Medication_History__c where Pre_Assessment__c=: currentRecordId]);
        return SubstanceList1 ;

}
    public static List<Treatment_History__c> getmeth3() {
//public static List<Substance_Abuse_History__c> fetchmeth1() {

        TreatmentList = new List<Treatment_History__c>([select id, Level_Of_Care__c,OwnerId,Facility__c,Length_of_Sobriety_Achieved__c,Name,Type_of_Discharge__c,Pre_Assessment__c,CreatedById,LastModifiedById,Length_of_Stay__c,Date_of_Episode__c from Treatment_History__c where Pre_Assessment__c=: currentRecordId]);
        return TreatmentList ;

}



}