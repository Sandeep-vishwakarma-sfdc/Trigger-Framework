/*******************************************************************************************
* @Name         AccountTriggerHandler 
* @Author       Sandeep Vishwakarma <sandeep.vishwakarma@skinternational.com>
* @Date         20/06/2022
* @Group        SKI
* @Description  Each trigger must have there saprate respective handler
*******************************************************************************************/
public without sharing class AccountTriggerHandler implements ITriggerHandler{
   public Trigger_Settings__mdt triggerMetaData = new Trigger_Settings__mdt();

    public AccountTriggerHandler(){} 
   public AccountTriggerHandler(String setttingName){ // load settings metadata 
    triggerMetaData = [select id,DeveloperName,ObjectName__c,Active__c from Trigger_Settings__mdt where DeveloperName=:setttingName];
   }

   /*
    * @Description  Use to Disable Trigger
    */
   public Boolean isDisabled(){
       return !triggerMetaData.Active__c;
   }

   /*
    * @Description  Before Insert event use this method to call helper methods
    */
   public void beforeInsert(List<Sobject> newItems){
       AccountAddress aa = new AccountAddress();
       aa.copyShippingAddressToBillingAddress(newItems);
   }

   /*
    * @Description  Before Insert event use this method to call helper methods
    */
   public void beforeUpdate(Map<Id,SObject> oldItems,Map<Id,Sobject> newItems){}

   /*
    * @Description  Before Insert event use this method to call helper methods
    */
   public void beforeDelete(Map<Id, SObject> oldItems) {}
 
   /*
    * @Description  After Insert event use this method to call helper methods
    */
   public void afterInsert(Map<Id, SObject> newItems) {}

   /*
    * @Description  After update event use this method to call helper methods
    */
   public void afterUpdate(Map<Id, SObject> oldItems, Map<Id, SObject> newItems) {}

   /*
    * @Description  After Delete event use this method to call helper methods
    */
   public void afterDelete(Map<Id,SObject> oldItems,Map<Id,Sobject> newItems) {}

   /*
    * @Description  After Undelete event use this method to call helper methods
    */
   public void afterUndelete(Map<Id, SObject> oldItems) {}
}