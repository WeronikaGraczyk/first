public without sharing class CarTriggerHandler extends TriggerHandler{
    
    public override void beforeDelete(){
        Map<Id,Car__c> cars=Trigger.oldMap;
        ChangeAccountBudget.increaseBudget(cars);
    }
    public override void afterInsert(){
        Map<Id,Car__c> cars=Trigger.newMap;
        ChangeAccountBudget.reductionBudget(cars);
    }
}
