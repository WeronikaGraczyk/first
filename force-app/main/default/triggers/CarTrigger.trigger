trigger CarTrigger on Car__c (after insert, before delete) {
    new CarTriggerHandler().run();
}