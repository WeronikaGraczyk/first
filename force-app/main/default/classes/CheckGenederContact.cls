public with sharing class CheckGenederContact {
    public static void checkGender(List<Contact> contacts){
        List<Contact> contactsToCheckGender = new List<Contact>();
        for(Contact contact : contacts){
            contact.Gender__c=whichGender(contact.FirstName);
            contactsToCheckGender.add(contact);
        } 
    }
    private static String whichGender(String firstname){
        String a = firstname.right(2);
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
        if(endNameTemplates.equals(endNameTemplates) ){
                return 'Female';
            }
        return 'Male';
    }
}