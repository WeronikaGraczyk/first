trigger CarTrigger on Car__c (after insert, after delete, after update) {
    new CarTriggerHandler().run();
}