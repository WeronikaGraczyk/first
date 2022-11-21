public without sharing class ChangeContactWalletValue {

    public static void increaseWallet(Map<id, Car__c> newCars){

        List<Contact> contactsToUpdate = new List<Contact>();
        Set<id> contactIds = getContactIdFromCar(newCars);
        List<Contact> contactFromCarId = [SELECT  id, Contact_Wallet__c FROM Contact WHERE id IN (SELECT Contacts__c FROM Car__c WHERE Contacts__c IN :contactIds)];

        for( Contact contact : contactFromCarId) {
            for( Car__c car : newCars.values()) {
                if(( contact.id).equals(car.Contacts__c)){
                    contact.Contact_Wallet__c += car.value__c;
                    contactsToUpdate.add(contact);
                }
            }
        }
        update contactsToUpdate;
    }

    public static void reductionWallet(Map<id, Car__c> newCars){
        List<Contact> contactsToUpdate = new List<Contact>();
        Set<id> contactIds = getContactIdFromCar(newCars);
        List<Contact> contactFromCarId = [SELECT  id, Contact_Wallet__c FROM Contact WHERE id IN (SELECT Contacts__c FROM Car__c WHERE Contacts__c IN :contactIds)];

        for( Contact contact : contactFromCarId) {
            for( Car__c car : newCars.values()) {
                if(( contact.id).equals(car.Contacts__c)){
                    contact.Contact_Wallet__c -= car.value__c;
                    contactsToUpdate.add(contact);
                }
            }
        }
        update contactsToUpdate;
    }
    private static Set<Id> getContactIdFromCar(Map<id,Car__c> CarsMap){
        Set<id> contactIds = new Set<id>();
        for(Car__c car: newCars.values()) {
            contactIds.add(car.Contacts__c);
        }
        return contactIds;
    }
}
