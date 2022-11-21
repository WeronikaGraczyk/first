public without sharing class CarTriggerHandler extends TriggerHandler{
    
    public override void beforeDelete(){
        Map<id, Car__c> newCarsMap = (Map<id, Car__c>) Trigger.oldMap;
        ChangeContactWalletValue.increaseWallet(newCarsMap);
    }

    public override void afterInsert(){
        Map<id, Car__c> newCarsMap = (Map<id, Car__c>) Trigger.newMap;
        ChangeContactWalletValue.reductionWallet(newCarsMap);
    }

}