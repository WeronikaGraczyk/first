@isTest
public with sharing class CheckGenederContact_Test {
    @isTest
    static void checkGenderWhenIsMale(){
        //given
        String firstname = 'foo';
        String lastname = 'bar';
        String gender = 'Male';
        //when
        Account a=new Account(name='ValidName');
        insert a;
        Contact c = [SELECT firstName, lastName, Gender__c FROM Contact WHERE AccountId =:a.id];
        //then
        
        System.assertEquals(firstName,c.firstName);
        System.assertEquals(lastName,c.lastName);
        System.assertEquals(gender,c.Gender__c);
    }
    static void checkGenderWhenIsFemale(){
        //given
        String firstname = 'foo';
        String lastname = 'bar';
        String gender = 'Female';
        //when
        Account a=new Account(name='ValidName');
        insert a;
        Contact c = [SELECT firstName, lastName, Gender__c FROM Contact WHERE AccountId =:a.id];
        c.firstName = 'Weronika';
        update c;
        c = [SELECT firstName, lastName, Gender__c FROM Contact WHERE AccountId =:a.id];
        //then
        
        System.assertEquals(firstName,c.firstName);
        System.assertEquals(lastName,c.lastName);
        System.assertEquals(gender,c.Gender__c);
    }
}
