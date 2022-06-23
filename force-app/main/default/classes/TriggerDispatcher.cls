public without sharing class TriggerDispatcher {

    public static void run(ITriggerHandler handler){
        if(handler.isDisabled()){
            return;
        }
        if(Trigger.isBefore){
            if(Trigger.isInsert){
                handler.beforeInsert(Trigger.new);
            }
            if(Trigger.isUpdate){
                handler.beforeUpdate(Trigger.oldMap, Trigger.newMap);
            }
            if(Trigger.isDelete){
                handler.beforeDelete(Trigger.oldMap);
            }
        }

        if(Trigger.isAfter){
            if(Trigger.isInsert){
                handler.afterInsert(Trigger.newMap);
            }
            if(Trigger.isUpdate){
                handler.afterUpdate(Trigger.oldMap, Trigger.newMap);
            }
            if(Trigger.isDelete){
                handler.afterDelete(Trigger.oldMap, Trigger.newMap);
            }
            if(Trigger.isUndelete){
                handler.afterUnDelete(Trigger.oldMap);
            }
        }
    }
}