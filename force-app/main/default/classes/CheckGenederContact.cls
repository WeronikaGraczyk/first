public with sharing class CheckGenederContact {
    public static void checkGender(List<Contact> contacts){
        List<Contact> contactsToCheckGender = new List<Contact>();
        for(Contact contact : contacts){
            contact.Gender__c = whichGender(contact.FirstName);
            contactsToCheckGender.add(contact);
        } 
    }
    public static String whichGender(String firstname){
        String endName = firstname.right(2);
        Set<String> endNameTemplates = new Set<String>{'na','ta','ia','wa','ja','la','da','ła','ra','ża','sa','ga','za','ka'};
        if(endNameTemplates.contains(endName) ){
                return 'Female';
        }
        return 'Male';
    }
}