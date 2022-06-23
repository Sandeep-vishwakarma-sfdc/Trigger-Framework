# Trigger Framework
Apex Trigger Framework is built with the following goals in mind:

    1. Single Trigger per Object
    2. Logic-less Triggers
    3. Simple Unit Testing
    4. Activate / Deactivate Trigger

## Custom Metadata

Custom Metadata Api Name : Trigger_Settings__mdt
| Fields | Description |
| -- | -- |    
|DeveloperName| Use to Access MetaData from TriggerHandler|
|Active__c| Use to Activate/Deactivate Trigger|
|ObjectName__c| Name of Object |

For Example : Account Trigger Setting 
![Trigger Setting for Account object](https://github.com/Sandeep-vishwakarma-sfdc/Trigger-Framework/blob/master/img/AccountTriggerSetting.jpg?raw=true)

## Create Trigger Handler
Create a single trigger handler class for each object. This class will implement the Trigger Handler interface provided. Add logic to retrieve the Custom Metadata record for that trigger as well has handle the IsDisabled flag. For example, the Trigger Handler for Account would look like this:

```java
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
       // call helper class having logic to implement
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
```

## Create One Trigger 
Create one trigger on an object. Include every trigger event. Call the Trigger Dispatcher run() method. For example, a Account trigger would look like this:
```
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    TriggerDispatcher.run(new AccountTriggerHandler('AccountTrigger'));
}
```
