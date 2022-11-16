public without sharing class ChangeAccountBudget {

    public static void increaseBudget( Map<id,Car__c> carsMap){
        List<Contact> contactsToUpdate = new List<Contact>();
        List<Contact> allContactsList = [SELECT  id, Contact_budget__c FROM Contact];
        for( Car__c car : carsMap.values()) {
            for( Contact contact : allContactsList) {
                if( contact.id.equals( car.Contacts__c)){
                    contact.Contact_budget__c += car.Value__c;
                    contactsToUpdate.add(contact);
                }
            }
        }
        update contactsToUpdate;
    }

    public static void reductionBudget(Map<id, Car__c> carsMap){
        List<Contact> contactsToUpdate=new List<Contact>();
        List<Contact> allContactsList=[SELECT  id, Contact_budget__c FROM Contact];
        for (Car__c car : carsMap.values()) {
            for (Contact contact : allContactsList) {
                if(contact.id.equals(car.Contacts__c)){
                    contact.Contact_budget__c = contact.Contact_budget__c - car.Purchase_price__c;
                    contactsToUpdate.add(contact);
                }
            }
        }
        update contactsToUpdate;
    }
}