/*******************************************************************************************
* @Name         AccountTrigger 
* @Author       Sandeep Vishwakarma <sandeep.vishwakarma@skinternational.com>
* @Date         20/06/2022
* @Group        SKI
* @Description  Trigger for Account object
*******************************************************************************************/
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
     /*
    * @Description  Identify event and call handler 
    * @Param		TriggerHandler class which implements ItriggerHandler interface
    */
    TriggerDispatcher.run(new AccountTriggerHandler('AccountTrigger'));
}