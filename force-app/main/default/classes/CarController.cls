public with sharing class CarController {

    @AuraEnabled(cacheable=true)
    public static List<Car__c> getAllCars(String AccountId){
        Account AccountIds = [SELECT id FROM Account WHERE id =: AccountId];

        List<Contact> contactList = [SELECT id FROM Contact WHERE AccountId =: AccountIds.id];

        Set<id> contactsIds = new Set<id>();
        for(Contact contact : contactList){
            contactsIds.add(contact.id);
        }

        return [SELECT Name__c, Fuel__c, Value__c FROM Car__c WHERE Contacts__c IN :contactsIds];
    }
}