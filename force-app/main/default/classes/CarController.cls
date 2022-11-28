public with sharing class CarController {
    @AuraEnabled(cacheable=true)
    public static List<Car__c> getAllCars(Id AccountId){
        System.debug([SELECT name FROM Account WHERE id=:AccountId]);
        System.debug(AccountId);
        List<Contact> contactList = [SELECT id FROM Contact WHERE AccountId =:AccountId];
        System.debug(contactList);
        Set<id> contactsIs = new Set<id>();
        for(Contact contact: contactList){
            contactsIs.add(contact.id);
        }
        System.debug(contactsIs);
        List<Car__c> cars = [SELECT Name__c, Fuel__c, Status__c, date_of_inspection__c,Value__c
                                    FROM Car__c WHERE Contacts__c IN :contactsIs]; 
        System.debug(cars);
        return cars;
    }
}
