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
    static void checkGenderWhenIsFemaleAfterUpdate(){
        
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
        Contact c1 = [SELECT firstName, lastName, Gender__c FROM Contact WHERE AccountId =:a.id];

        //then
        
        System.assertEquals('Weronika',c1.firstName);
        System.assertEquals(lastName,c1.lastName);
        System.assertEquals(gender,c1.Gender__c);
    }
    @isTest
    static void checkGenderWhenInsertContactIsMale(){
        
        //given
        String firstnameValid = 'foo';
        String lastnameValid = 'bar';
        String gender='Male';

        //when
        Contact c=new Contact(firstName=firstnameValid, lastName=lastnameValid);
        insert c;
        System.debug(c.id);
        Contact c1=[SELECT firstName,lastName,Gender__c FROM Contact WHERE id=:c.id];

        //then
        
        System.assertEquals(firstnameValid,c1.firstName);
        System.assertEquals(lastnameValid,c1.lastName);
        System.assertEquals(gender,c1.Gender__c);
    }
    @isTest
    static void checkGenderWhenInsertContactIsFemale(){
        
        //given
        String firstnameValid = 'Weronika';
        String lastnameValid = 'bar';
        String gender='Female';

        //when
        Contact c=new Contact(firstName=firstnameValid, lastName=lastnameValid);
        insert c;
        System.debug(c.id);
        Contact c1=[SELECT firstName,lastName,Gender__c FROM Contact WHERE id=:c.id];

        //then
        
        System.assertEquals(firstnameValid,c1.firstName);
        System.assertEquals(lastnameValid,c1.lastName);
        System.assertEquals(gender,c1.Gender__c);
    }
}
