public without sharing class AccountTriggerHandler implements ITriggerHandler{
   public Trigger_Settings__mdt triggerMetaData = new Trigger_Settings__mdt();

    public AccountTriggerHandler(){} 
   public AccountTriggerHandler(String setttingName){
    triggerMetaData = [select id,DeveloperName,ObjectName__c,Active__c from Trigger_Settings__mdt where DeveloperName=:setttingName];
   }

   public Boolean isDisabled(){
       return !triggerMetaData.Active__c;
   }

   public void beforeInsert(List<Sobject> newItems){
       AccountAddress aa = new AccountAddress();
       aa.copyShippingAddressToBillingAddress(newItems);
   }

   public void beforeUpdate(Map<Id,SObject> oldItems,Map<Id,Sobject> newItems){}
   public void beforeDelete(Map<Id, SObject> oldItems) {}
 
   public void afterInsert(Map<Id, SObject> newItems) {}

   public void afterUpdate(Map<Id, SObject> oldItems, Map<Id, SObject> newItems) {}

   public void afterDelete(Map<Id,SObject> oldItems,Map<Id,Sobject> newItems) {}

   public void afterUndelete(Map<Id, SObject> oldItems) {}
}