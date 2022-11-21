public without sharing class ChangeContactWalletValue {

    public static void changeWalletValue(Map<id, Car__c> newCars){

        List<Contact> contactsToUpdate = new List<Contact>();
        Set<id> contactIds = getContactIdFromCar(newCars);
        List<Contact> contactsWithCars = [SELECT Id, Contact_Wallet__c, Contact_budget__c, (SELECT Id, Value__c FROM Cars__r) FROM Contact WHERE Id IN: contactIds];
        
        for(Contact contactTemp : contactsWithCars) {
            Double newContactWallet = 0;
            for(Car__c carTemp : contactTemp.Cars__r){
                newContactWallet += carTemp.Value__c;
            }
            newContactWallet = contactTemp.Contact_budget__c - newContactWallet;

            if(contactTemp.Contact_Wallet__c != newContactWallet){

                contactTemp.Contact_Wallet__c = newContactWallet;
                contactsToUpdate.add(contactTemp);
            }
        }
        if(!contactsToUpdate.isEmpty()){
        update contactsToUpdate;   
        }
    }

    private static Set<Id> getContactIdFromCar(Map<id, Car__c> newCars){
        Set<id> contactIds = new Set<id>();
        for(Car__c car: newCars.values()) {
            contactIds.add(car.Contacts__c);
        }
        return contactIds;
    }
}
