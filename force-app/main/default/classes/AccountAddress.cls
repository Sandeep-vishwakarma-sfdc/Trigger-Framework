/*******************************************************************************************
* @Name         AccountAddress 
* @Author       Sandeep Vishwakarma <sandeep.vishwakarma@skinternational.com>
* @Date         20/06/2022
* @Group        SKI
* @Description  Helper Class to Add logic
*******************************************************************************************/
public class AccountAddress {

     /*
    * @Description  This method copy shipping country Name to Billing Country Name before on before insert event
    */
    public void copyShippingAddressToBillingAddress(List<Sobject> newItems){
        List<Account> newAccount = (List<Account>)newItems;
        for(Account acc:newAccount){
            acc.BillingCountry = acc.ShippingCountry;
        }
    }
}