public class UpdateOpportunity {
    
    public static void methodToMap(List<Lead> leads)
    {
         Map<id,Lead> oppIDLeadMap = new Map<id,Lead>();
         List<Opportunity> OpptoInsert = new List<Opportunity>();
         List<VOB__c> vobToInsert = new List<VOB__c>();
        List<Account> acctInsert=new List<Account>();
        List<Contact> conInsert=new List<contact>();
        
         for(Lead ld:leads){
             if(ld.isConverted==true){
               oppIDLeadMap.put(ld.ConvertedOpportunityId, ld);
                 if(ld.ConvertedOpportunityId!=null){
                     
                  if(ld.Has_Insurance__c== false){
                    OpptoInsert.add(new Opportunity(id = ld.ConvertedOpportunityId,Name=ld.Client_Full_Name__c,Client_Email__c=ld.Email,Caller_First_Name__c=ld.FirstName, Caller_Last_Name__c=ld.LastName,
                          StageName = 'Active',Caller_Email__c = ld.Caller_Email__c,SSN__c = ld.SSN__c,Street__c=ld.Street,City__c=ld.City,Zip__c=ld.PostalCode,
                                                    State1__c=ld.State,Country__c=ld.Country,CampaignId=ld.Campaign__c));
                  }
                  else {
                 OpptoInsert.add(new Opportunity(id = ld.ConvertedOpportunityId,Name=ld.Client_Full_Name__c,Client_Email__c=ld.Email, StageName = 'VOB In Queue',Caller_First_Name__c=ld.FirstName, Caller_Last_Name__c=ld.LastName,
                                                 Caller_Email__c = ld.Caller_Email__c,SSN__c = ld.SSN__c,Street__c=ld.Street,City__c=ld.City,Zip__c=ld.PostalCode,
                                                 State1__c=ld.State,Country__c=ld.Country,CampaignId=ld.Campaign__c));
                  //system.debug('YES');
                  }
                 if(ld.Company==null){
                 acctInsert.add(new Account(id = ld.ConvertedAccountId,FirstName = ld.Client_First_Name__c, 
                                             MiddleName =ld.Client_Middle_Name__c, LastName=ld.Client_Last_Name__c,Phone=ld.Client_Phone__c,Date_OF_Birth__c=ld.Test_DOB__c));}
                 else{
                     acctInsert.add(new Account(id=ld.ConvertedAccountId,Name=ld.Company,Phone=ld.Client_Phone__c));
                     conInsert.add(new Contact(id=ld.ConvertedContactId, firstName=ld.Client_First_Name__c,MiddleName=ld.Client_Middle_Name__c
                                              ,LastName=ld.Client_Last_Name__c));
                 }}
                     
                else{
                     if(ld.Company==null){
                 acctInsert.add(new Account(id = ld.ConvertedAccountId,FirstName = ld.Client_First_Name__c, 
                                             MiddleName =ld.Client_Middle_Name__c, LastName=ld.Client_Last_Name__c,
                                            Phone=ld.Client_Phone__c));
                     }
                 else{
                     acctInsert.add(new Account(id=ld.ConvertedAccountId,Name=ld.Company,Phone=ld.Client_Phone__c));
                     conInsert.add(new Contact(id=ld.ConvertedContactId, firstName=ld.Client_First_Name__c,MiddleName=ld.Client_Middle_Name__c
                                              ,LastName=ld.Client_Last_Name__c));
                     }
                      
                  }
            
             }
         }
         update OpptoInsert;  
         update acctInsert;
        update conInsert;
        for(ID oppid:oppIDLeadMap.keySet()){
            Lead l=oppIDLeadMap.get(oppid);
          if(l.ConvertedOpportunityId!=null){
            if(l.Has_Insurance__c==True){
                
                VOB__c vob1=new VOB__c();
                vob1.Patient_Name_admission__c= oppId;
                vob1.Stage__c = 'VOB In Queue';
                vob1.Client_First_Name__c=l.Client_First_Name__c;
                vob1.Client_Last_Name__c=l.Client_Last_Name__c;
                vob1.Client_DOB__c=l.Client_DOB__c;
                vob1.Email__c=l.Email;
                vob1.Phone__c=l.Phone;
                  
                string add1=l.Country+','+l.State+','+l.Street+','+l.City+','+l.PostalCode;
                List<string> addList=add1.split(',');
                string[] addfinal=new string[]{};
                string append1;
                for(string s: addList){
                    
                    if(s!='NULL'){
                        addfinal.add(s);
                    }
                }
                append1=string.join(addfinal,',');
                vob1.Subs_Address__c=append1;
                system.debug('Address is->'+vob1.Subs_Address__c);
                
                vob1.Insurance_Provider_lookup__c=l.Insurance_Provider_lookup__c;
                System.debug('Pri_Insurance_Provide__c '+l.Insurance_Provider_lookup__c);
                vob1.Member_ID_New__c=l.Member_ID__c;
                vob1.Group_Number_New__c=l.Group__c;
                
                vobToInsert.add(vob1);
                system.debug('List is'+vobToInsert);
                system.debug('Primary vob is:'+vob1);
                
            }
              if(l.Has_Secondary_Insurance__c==true){
                   
                VOB__c vob=new VOB__c();
                vob.Patient_Name_admission__c= oppId;
                vob.Stage__c = 'VOB In Queue';
                vob.Client_First_Name__c=l.Client_First_Name__c;
                vob.Client_Last_Name__c=l.Client_Last_Name__c;
                vob.Client_DOB__c=l.Client_DOB__c;
                vob.Email__c=l.Email;
                vob.Phone__c=l.Phone;
  
                string add1=l.Country+','+l.State+','+l.Street+','+l.City+','+l.PostalCode;
                List<string> addList=add1.split(',');
                string[] addfinal=new string[]{};
                string append1;
                for(string s: addList){
                    
                    if(s!='NULL'){
                        addfinal.add(s);
                    }
                }
                append1=string.join(addfinal,',');
                vob.Subs_Address__c=append1;
                system.debug('Address is->'+vob.Subs_Address__c);
                
                vob.Insurance_Provider_lookup__c=l.Secondary_Insurance_Provide__c;
                System.debug('Secondary_Insurance_Provide__c '+l.Secondary_Insurance_Provide__c);
                vob.Member_ID_New__c=l.Secondary_Member_ID__c;
                vob.Group_Number_New__c=l.Secondary_Group__c;
                vobToInsert.add(vob);
                system.debug('List is'+vobToInsert);
                  system.debug('Secondary vob is:'+vob);
                  
                 
              }
              
            }
            insert vobToInsert;
            update vobToInsert;
          }
            
        }
              
   }