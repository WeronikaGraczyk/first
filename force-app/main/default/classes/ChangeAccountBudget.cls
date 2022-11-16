public without sharing class ChangeAccountBudget {
    public static void increaseBudget(Map<id,Car__c> cars){
        List<Contact> contactsToUpdate=new List<Contact>();
        List<Contact> contacts=[SELECT  id, Contact_budget__c FROM Contact];
        for (Car__c car : cars.values()) {
            for (Contact contact : contacts) {
                if(contact.id.equals(car.Contacts__c)){
                    contact.Contact_budget__c += car.Value__c;
                    contactsToUpdate.add(contact);
                }
            }
        }
        update contactsToUpdate;
    }
    public static void reductionBudget(Map<id, Car__c> cars){

        List<Contact> contactsToUpdate=new List<Contact>();
        List<Contact> contacts=[SELECT  id, Contact_budget__c FROM Contact];
        for (Car__c car : cars) {
            for (Contact contact : contacts) {
                if(contact.id.equals(car.Contacts__c)){
                    contact.Contact_budget__c -= car.Value__c;
                    contactsToUpdate.add(contact);
                }
            }
        }
        update contactsToUpdate;
    }
}