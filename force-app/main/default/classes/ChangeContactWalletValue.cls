public without sharing class ChangeContactWalletValue {

    public static void increaseWallet(List<Car__c> newCars){
        List<Contact> contactsToUpdate = new List<Contact>();
        List<Contact> allContactsList = [SELECT  id, Contact_Wallet__c FROM Contact];
        for( Contact contact : allContactsList) {
            for( Car__c car : newCars) {
                if(( contact.id).equals(car.Contacts__c)){
                    contact.Contact_Wallet__c += car.Value__c;
                    contactsToUpdate.add(contact);
                }
            }
        }
        update contactsToUpdate;
    }

    public static void reductionWallet(List<Car__c> newCars){
        List<Contact> contactsToUpdate = new List<Contact>();
        List<Contact> allContactsList = [SELECT  id, Contact_Wallet__c FROM Contact];
        for( Contact contact : allContactsList) {
            for( Car__c car : newCars) {
                if(( contact.id).equals(car.Contacts__c)){
                    contact.Contact_Wallet__c -= car.Purchase_price__c;
                    contactsToUpdate.add(contact);
                }
            }
        }
        update contactsToUpdate;
    }

}
