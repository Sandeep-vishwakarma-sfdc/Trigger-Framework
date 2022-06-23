public class AccountAddress {

    public void copyShippingAddressToBillingAddress(List<Sobject> newItems){
        List<Account> newAccount = (List<Account>)newItems;
        for(Account acc:newAccount){
            acc.BillingCountry = acc.ShippingCountry;
        }
    }
}