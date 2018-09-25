package Model;

import java.sql.Date;

public class drivers_customer {

   private String firstname;
   private String lastname;
   private String name;
   private String street;
   private Date pickupdate;
   private String pickup_time;


    public drivers_customer(String firstname, String lastname, String name, String street, Date pickupdate, String pickup_time) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.name = name;
        this.street = street;
        this.pickupdate = pickupdate;
        this.pickup_time = pickup_time;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public Date getPickupdate() {
        return pickupdate;
    }

    public void setPickupdate(Date pickupdate) {
        this.pickupdate = pickupdate;
    }

    public String getPickup_time() {
        return pickup_time;
    }

    public void setPickup_time(String pickup_time) {
        this.pickup_time = pickup_time;
    }
}
