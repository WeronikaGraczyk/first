public without sharing class ChangeAccountWallet {
    
    public static void updateAccountWallet(Map<Id, Contact> newContacts, Map<Id, Contact> oldContacts){
        Map<Contact, Double> contactsAfterWalletUpdate = filterContactAfterWalletUpdate(newContacts, oldContacts);
        Set<id> accountIds =getIdAccountFromContact(newContacts);
        List<Account> accountsFromContacts = new List<Account>([SELECT id, Account_Wallet__c FROM Account WHERE id IN :accountIds]);
        List<Account> accountsToUpdate = new List<Account>();

        for(Account account : accountsFromContacts){
            for(Contact contact : contactsAfterWalletUpdate.keySet()){
                if(account.id == contact.AccountId){
                    account.Account_Wallet__c = account.Account_Wallet__c + contactsAfterWalletUpdate.get(contact);
                    accountsToUpdate.add(account);
                }
            }
        }
        update accountsToUpdate;
    }

    private static Map<Contact, Double> filterContactAfterWalletUpdate(Map<Id, Contact> newContacts, Map<Id, Contact> oldContacts){
        Map<Contact, Double> contactsAfterWalletUpdate = new Map<Contact, double>();
        for(Contact newContact: newContacts.values()) {
            if(oldContacts.get(newContact.Id).Contact_Wallet__c != newContact.Contact_Wallet__c ) {
            contactsAfterWalletUpdate.put(newContact, newContact.Contact_Wallet__c - oldContacts.get(newContact.Id).Contact_Wallet__c);
            }
        }
        return contactsAfterWalletUpdate;
    }

    private static Set<id> getIdAccountFromContact(Map<Id, Contact> contacts){
        Set<id> accountIds = new Set<id>();
        for(Contact contact : contacts.values()) {
            accountIds.add(contact.AccountId);
        }
        return accountIds;

    }
}
