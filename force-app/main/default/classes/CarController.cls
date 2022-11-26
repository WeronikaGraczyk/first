public with sharing class CarController {
    @AuraEnabled(cacheable=true)
    public static List<Car__c> getAllCars(){
        // Set<id> ContactsId = [SELECT id FROM Contact WHERE id = AccountId];
        // List<Car__c> cars = SELECT Name__c, Fuel__c, Status__c, date_of_inspection__c,Value__c
        // FROM Car__c WHERE id IN ContactsId; 
        // System.debug(ContactsId);
        // System.debug(cars);
        return [
            SELECT Name__c, Fuel__c, Status__c, date_of_inspection__c,Value__c
            FROM Car__c
            WITH SECURITY_ENFORCED
       ];
    }
}
