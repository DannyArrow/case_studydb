package Model;

import java.sql.Date;

public class Order_table {

    private Date dateorder;
    private int amount_of_bags;
    private int amount_of_dryitem;
    private double washfold_total;
    private double drycleaning_total;
    private int laundrycarepackage_id;
    private boolean drycleaning;
    private boolean pickup_status;
    private boolean dropoff_status;
    private boolean cancelorder;
    private boolean driver_on_its_way;
    private String pickup_time;
    private String pickupdate;
    private String dropoff_time;
    private String dropoffdate;
    private boolean personless_pickup;
    private boolean personless_dropoff;
    private String pickupnotes;
    private String dropoffnotes;
    private int customerid;
    private String pickup_Driver;
    private String dropoff_drivers;
    private int payment_id;

    public Date getDateorder() {
        return dateorder;
    }

    public void setDateorder(Date dateorder) {
        this.dateorder = dateorder;
    }

    public int getAmount_of_bags() {
        return amount_of_bags;
    }

    public void setAmount_of_bags(int amount_of_bags) {
        this.amount_of_bags = amount_of_bags;
    }

    public int getAmount_of_dryitem() {
        return amount_of_dryitem;
    }

    public void setAmount_of_dryitem(int amount_of_dryitem) {
        this.amount_of_dryitem = amount_of_dryitem;
    }

    public double getWashfold_total() {
        return washfold_total;
    }

    public void setWashfold_total(double washfold_total) {
        this.washfold_total = washfold_total;
    }

    public double getDrycleaning_total() {
        return drycleaning_total;
    }

    public void setDrycleaning_total(double drycleaning_total) {
        this.drycleaning_total = drycleaning_total;
    }

    public int getLaundrycarepackage_id() {
        return laundrycarepackage_id;
    }

    public void setLaundrycarepackage_id(int laundrycarepackage_id) {
        this.laundrycarepackage_id = laundrycarepackage_id;
    }

    public boolean isDrycleaning() {
        return drycleaning;
    }

    public void setDrycleaning(boolean drycleaning) {
        this.drycleaning = drycleaning;
    }

    public boolean isPickup_status() {
        return pickup_status;
    }

    public void setPickup_status(boolean pickup_status) {
        this.pickup_status = pickup_status;
    }

    public boolean isDropoff_status() {
        return dropoff_status;
    }

    public void setDropoff_status(boolean dropoff_status) {
        this.dropoff_status = dropoff_status;
    }

    public boolean isCancelorder() {
        return cancelorder;
    }

    public void setCancelorder(boolean cancelorder) {
        this.cancelorder = cancelorder;
    }

    public boolean isDriver_on_its_way() {
        return driver_on_its_way;
    }

    public void setDriver_on_its_way(boolean driver_on_its_way) {
        this.driver_on_its_way = driver_on_its_way;
    }

    public String getPickup_time() {
        return pickup_time;
    }

    public void setPickup_time(String pickup_time) {
        this.pickup_time = pickup_time;
    }

    public String getPickupdate() {
        return pickupdate;
    }

    public void setPickupdate(String pickupdate) {
        this.pickupdate = pickupdate;
    }

    public String getDropoff_time() {
        return dropoff_time;
    }

    public void setDropoff_time(String dropoff_time) {
        this.dropoff_time = dropoff_time;
    }

    public String getDropoffdate() {
        return dropoffdate;
    }

    public void setDropoffdate(String dropoffdate) {
        this.dropoffdate = dropoffdate;
    }

    public boolean isPersonless_pickup() {
        return personless_pickup;
    }

    public void setPersonless_pickup(boolean personless_pickup) {
        this.personless_pickup = personless_pickup;
    }

    public boolean isPersonless_dropoff() {
        return personless_dropoff;
    }

    public void setPersonless_dropoff(boolean personless_dropoff) {
        this.personless_dropoff = personless_dropoff;
    }

    public String getPickupnotes() {
        return pickupnotes;
    }

    public void setPickupnotes(String pickupnotes) {
        this.pickupnotes = pickupnotes;
    }

    public String getDropoffnotes() {
        return dropoffnotes;
    }

    public void setDropoffnotes(String dropoffnotes) {
        this.dropoffnotes = dropoffnotes;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public String getPickup_Driver() {
        return pickup_Driver;
    }

    public void setPickup_Driver(String pickup_Driver) {
        this.pickup_Driver = pickup_Driver;
    }

    public String getDropoff_drivers() {
        return dropoff_drivers;
    }

    public void setDropoff_drivers(String dropoff_drivers) {
        this.dropoff_drivers = dropoff_drivers;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }
}
