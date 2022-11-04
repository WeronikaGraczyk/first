@isTest
public with sharing class CreateNewContact_Test {

    @isTest
    static void checkContactWhenInsertAccount(){
        //given
        String firstname = 'foo';
        String lastname = 'bar';
        //when
        Account a=new Account(name='ValidName');
        insert a;
        //then
        Contact c = [SELECT firstName, lastName FROM Contact WHERE AccountId =:a.id];
        System.assertEquals(firstName,c.firstName);
        System.assertEquals(lastName,c.lastName);
    }
}
