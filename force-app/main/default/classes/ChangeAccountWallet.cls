public without sharing class ChangeAccountWallet {
    
    public static void isWalletUpdate(List<Contact> newContacts, List<Contact> oldContacts){
        Map<Contact, Double> contactsAfterWalletUpdate = new Map<Contact, double>();
        for(Contact newContact : newContacts){
            for(Contact oldContact : oldContacts){
                if(oldContact.id == newContact.id && oldContact.Contact_Wallet__c != newContact.Contact_Wallet__c){
                    contactsAfterWalletUpdate.put(newContact, newContact.Contact_Wallet__c - oldContact.Contact_Wallet__c);
                }
            }   
        }

        updateAccountWallet(contactsAfterWalletUpdate);
    }

    private static void updateAccountWallet(Map<Contact, Double> contactsAfterWalletUpdate){
        List<Account> allAccounts = [SELECT Account_Wallet__c, id, Budget__c FROM Account];
        List<Account> accountsToUpdate = new List<Account>();
        for(Account account : allAccounts){
            for(Contact contact : contactsAfterWalletUpdate.keySet()){
                if(account.id == contact.AccountId){
                    account.Account_Wallet__c = account.Account_Wallet__c + contactsAfterWalletUpdate.get(contact);
                    accountsToUpdate.add(account);
                }
            }
        }
        update accountsToUpdate;
    }
}
