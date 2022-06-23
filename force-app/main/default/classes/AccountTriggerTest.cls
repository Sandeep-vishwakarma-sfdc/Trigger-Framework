@isTest
public class AccountTriggerTest {
    @isTest
    public static void testAll(){
        List<Account> acclst = new List<Account>();
        for(integer i=1;i<=10;i++){
            Account acc = new Account();
            acc.Name = 'Account Test'+i;
            acc.BillingState = 'Maharashtra';
            acc.ShippingState = 'Maharashtra';
            acclst.add(acc);
        }
       
        Test.startTest();
        	insert acclst;
        Test.stopTest();
        
        List<Account> lstAcc = [select Id,Name from Account];
        System.assertEquals(10, lstAcc.size());
    }
}