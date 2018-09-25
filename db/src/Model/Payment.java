package Model;

public class Payment {

   private int paymentID;
   private String billingname;
   private long credit_card_number;
   private String expire_date;
   private String paymenttype;

    public int getPayment() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public String getBillingname() {
        return billingname;
    }

    public void setBillingname(String billingname) {
        this.billingname = billingname;
    }

    public long getCredit_card_number() {
        return credit_card_number;
    }

    public void setCredit_card_number(long credit_card_number) {
        this.credit_card_number = credit_card_number;
    }

    public String getExpire_date() {
        return expire_date;
    }

    public void setExpire_date(String expire_date) {
        this.expire_date = expire_date;
    }

    public String getPaymenttype() {
        return paymenttype;
    }

    public void setPaymenttype(String paymenttype) {
        this.paymenttype = paymenttype;
    }
}
