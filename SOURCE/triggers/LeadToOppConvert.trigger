trigger LeadToOppConvert on Lead (after insert,after update) {

if(trigger.isAfter && trigger.isUpdate)
{
    if(StopRecursion.isFirstTime )
   {
        StopRecursion.isFirstTime=false;
        UpdateOpportunity.methodToMap(trigger.new);
   }

   // UpdateOpportunity.methodToMap(trigger.new);
}
}