public without sharing class CarTriggerHandler extends TriggerHandler{
    
    public override void beforeDelete(){
        List<Car__c> cars = Trigger.old;
        ChangeContactWalletValue.increaseWallet(cars);
    }

    public override void afterInsert(){
        List<Car__c> cars =Trigger.new;
        ChangeContactWalletValue.reductionWallet(cars);
    }
}
