public with sharing class CreateNewContact {

    public static void createContact(List<Account> newAccounts){
        List<Contact> contactList=new List<Contact>();

        for(Account a:newAccounts){
            contactList.add(new Contact(FirstName='foo', LastName='bar', AccountId=a.id, Gender__c=checkGender('weronika')));
        }
        insert contactList;
    }
    public static String checkGender(String firstname){
        String a=firstname.right(2);
        if( a.equals('ka') || a.equals('na') || a.equals('ta') || a.equals('ia') || 
            a.equals('wa') || a.equals('ja') || a.equals('la') || a.equals('da') || 
            a.equals('ła') || a.equals('ra') || a.equals('ża') || a.equals('sa') || 
            a.equals('ga') || a.equals('za')){
                return 'Female';
            }
            return 'Male';
        }
}