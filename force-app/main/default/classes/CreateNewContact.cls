public with sharing class CreateNewContact {

    public static void createContact(List<Account> newAccounts){
        List<Contact> contactList = new List<Contact>();

        for(Account a : newAccounts){
            contactList.add(new Contact(FirstName='foo', LastName='bar', AccountId=a.id, Gender__c=checkGender('weronika')));
        }
        insert contactList;
    }
    public static String checkGender(String firstname){
        String endName = firstname.right(2);
        List<String> endNameTemplates = new List<String>();
        endNameTemplates.add('na');
        endNameTemplates.add('ta');
        endNameTemplates.add('ia');
        endNameTemplates.add('wa');
        endNameTemplates.add('ja');
        endNameTemplates.add('la');
        endNameTemplates.add('da');
        endNameTemplates.add('ła');
        endNameTemplates.add('ra');
        endNameTemplates.add('ża');
        endNameTemplates.add('sa');
        endNameTemplates.add('ga');
        endNameTemplates.add('za');
        endNameTemplates.add('ka');
        System.debug(endName);
        if(endNameTemplates.contains(endName)){
                return 'Female';
        }
        return 'Male';
    }
}