trigger CarTrigger on Car__c (after insert, before delete, after update) {
    new CarTriggerHandler().run();
}