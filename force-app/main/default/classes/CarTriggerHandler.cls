public without sharing class CarTriggerHandler extends TriggerHandler{
    
    public override void afterDelete(){
        Map<id, Car__c> oldCarsMap = (Map<id, Car__c>) Trigger.oldMap;
        ChangeContactWalletValue.changeWalletValue(oldCarsMap);
    }

    public override void afterInsert(){
        Map<id, Car__c> newCarsMap = (Map<id, Car__c>) Trigger.newMap;z
        ChangeContactWalletValue.changeWalletValue(newCarsMap);
    }

}