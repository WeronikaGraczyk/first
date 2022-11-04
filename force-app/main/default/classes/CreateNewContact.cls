public with sharing class CreateNewContact {

    public static void createContact(List<Account> newAccounts){
        List<Contact> contactList=new List<Contact>();
        for(Account a:newAccounts){
            contactList.add(new Contact(FirstName='foo', LastName='bar', AccountId=a.id));
        }
        insert contactList;
    }
}
