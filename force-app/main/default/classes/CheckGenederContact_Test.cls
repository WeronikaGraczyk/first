@isTest
public with sharing class CheckGenederContact_Test {
    @isTest
    static void checkGenderWhenIsMale(){
        //given
        String firstname = 'foo';
        String lastname = 'bar';
        String gender = 'Male';
        //when
        Account account=new Account(name='ValidName');
        insert account;
        Contact contact = [SELECT firstName, lastName, Gender__c FROM Contact WHERE AccountId =:account.id];

        //then
        System.assertEquals(firstName, contact.firstName);
        System.assertEquals(lastName, contact.lastName);
        System.assertEquals(gender, contact.Gender__c);
    }

    @isTest
    static void checkGenderWhenIsFemaleAfterUpdate(){
        
        //given
        String firstname = 'foo';
        String lastname = 'bar';
        String gender = 'Female';

        //when
        Account account = new Account(name='ValidName');
        insert account;
        Contact contact = [SELECT firstName, lastName, Gender__c FROM Contact WHERE AccountId =:account.id];
        contact.firstName = 'Weronika';
        update contact;
        Contact contactAfterUpdate = [SELECT firstName, lastName, Gender__c FROM Contact WHERE AccountId =:account.id];

        //then
        System.assertEquals('Weronika', contactAfterUpdate.firstName);
        System.assertEquals(lastName, contactAfterUpdate.lastName);
        System.assertEquals(gender, contactAfterUpdate.Gender__c);
    }

    @isTest
    static void checkGenderWhenInsertContactIsMale(){
        
        //given
        String firstnameValid = 'foo';
        String lastnameValid = 'bar';
        String gender = 'Male';

        //when
        Contact contact=new Contact(firstName=firstnameValid, lastName=lastnameValid);
        insert contact;
        Contact contactAfterInsert = [SELECT firstName,lastName,Gender__c FROM Contact WHERE id=:contact.id];

        //then
        System.assertEquals(firstnameValid,contactAfterInsert.firstName);
        System.assertEquals(lastnameValid,contactAfterInsert.lastName);
        System.assertEquals(gender,contactAfterInsert.Gender__c);
    }

    @isTest
    static void checkGenderWhenInsertContactIsFemale(){
        
        //given
        String firstnameValid = 'Weronika';
        String lastnameValid = 'bar';
        String gender = 'Female';

        //when
        Contact contact = new Contact(firstName=firstnameValid, lastName=lastnameValid);
        insert contact;
        Contact contactAfterInsert = [SELECT firstName,lastName,Gender__c FROM Contact WHERE id=:contact.id];

        //then
        System.assertEquals(firstnameValid, contactAfterInsert.firstName);
        System.assertEquals(lastnameValid, contactAfterInsert.lastName);
        System.assertEquals(gender, contactAfterInsert.Gender__c);
    }
}
