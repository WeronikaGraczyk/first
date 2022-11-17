@isTest
public with sharing class CreateNewContact_Test {

    @isTest
    static void checkContactWhenInsertAccount(){
        //given
        String firstname = 'foo';
        String lastname = 'bar';

        //when
        Account account = new Account( name = 'ValidName');
        insert account;

        //then
        System.assertEquals(account, [SELECT name FROM Account WHERE id=:account.id]);
        Contact contact = [SELECT firstName, lastName FROM Contact WHERE AccountId =:account.id];
        System.assertEquals(firstName, contact.firstName);
        System.assertEquals(lastName, contact.lastName);
    }
}
