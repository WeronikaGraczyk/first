public with sharing class CheckGenederContact {
    public static void checkGender(List<Contact> contact){
        List<Contact> retur = new List<Contact>();
        for(Contact c:contact){
            c.Gender__c=whichGender(c.FirstName);
            retur.add(c);
            System.debug(c.Gender__c);
        } 
    }
    private static String whichGender(String firstname){
        String a = firstname.right(2);
        if( a.equals('na') || a.equals('ta') || a.equals('ia') || a.equals('wa') ||
            a.equals('ja') || a.equals('la') || a.equals('da') || a.equals('ła') ||
            a.equals('ra') || a.equals('ża') || a.equals('sa') || a.equals('ga') || 
            a.equals('za')){
                return 'Female';
                System.debug('debug '+firstName);
            }
        return 'Male';
    }
}
