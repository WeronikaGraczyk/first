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
    @isTest
    static void checkGenderWhenIsFemale(){
        
        //given
        String firstname = 'foo';
        String lastname = 'bar';
        String gender = 'Female';
        //when
        Account a=new Account(name='ValidName');
        insert a;
        Contact c = [SELECT firstName, lastName, Gender__c FROM Contact WHERE AccountId =:a.id];
        System.debug(c.firstName);
        System.debug(c.lastName);
        System.debug(c.Gender__c);
        c.firstName = 'Weronika';
        update c;
        Contact c1 = [SELECT firstName, lastName, Gender__c FROM Contact AccountId =:a.id];
        System.debug(c1.firstName);
        System.debug(c1.lastName);
        System.debug(c1.Gender__c);
        //then
        
        System.assertEquals('Weronika',c1.firstName);
        System.assertEquals(lastName,c1.lastName);
        System.assertEquals(gender,c1.Gender__c);
    }
}
