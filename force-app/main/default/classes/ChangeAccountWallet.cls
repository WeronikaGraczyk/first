public without sharing class ChangeAccountWallet {
    
    public static void updateAccountWallet(List<Contact> newContacts, List<Contact> oldContacts){
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

    private static Map<Contact, Double> filterContactAfterWalletUpdate(List<Contact> newContacts, List<Contact> oldContacts){
        Map<Contact, Double> contactsAfterWalletUpdate = new Map<Contact, double>();
        for(Contact newContact : newContacts){
            for(Contact oldContact : oldContacts){
                if(oldContact.id == newContact.id && oldContact.Contact_Wallet__c != newContact.Contact_Wallet__c){
                    contactsAfterWalletUpdate.put(newContact, newContact.Contact_Wallet__c - oldContact.Contact_Wallet__c);
                }
            }   
        }
        return contactsAfterWalletUpdate;
    }

    private static Set<id> getIdAccountFromContact(List<Contact> contacts){
        Set<id> accountIds = new Set<id>();
        for(Contact contact : contacts) {
            accountIds.add(contact.AccountId);
        }
        return accountIds;

    }
}
