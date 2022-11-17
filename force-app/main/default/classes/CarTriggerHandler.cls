public without sharing class CarTriggerHandler extends TriggerHandler{
    
    public override void beforeDelete(){
        List<Car__c> newCars = Trigger.old;
        ChangeContactWalletValue.increaseWallet(newCars);
    }

    public override void afterInsert(){
        List<Car__c> newCars = Trigger.new;
        ChangeContactWalletValue.reductionWallet(newCars);
    }

}