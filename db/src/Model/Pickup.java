package Model;

public class Pickup {

    private String firstName;
    private String lastname;
    private String phone;
    private String street;
    private String city;
    private String zip;
    private String type_of_building;
    private String drycleaning;
    private String pickupnotes;
    private String Package;

    public Pickup(){

    }


    public Pickup(String firstName, String lastname, String phone, String street, String city, String zip, String type_of_building, String drycleaning, String pickupnotes, String Package) {
        this.firstName = firstName;
        this.lastname = lastname;
        this.phone = phone;
        this.street = street;
        this.city = city;
        this.zip = zip;
        this.type_of_building = type_of_building;
        this.drycleaning = drycleaning;
        this.pickupnotes = pickupnotes;
        this.Package = Package;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getType_of_building() {
        return type_of_building;
    }

    public void setType_of_building(String type_of_building) {
        this.type_of_building = type_of_building;
    }

    public String getDrycleaning() {
        return drycleaning;
    }

    public void setDrycleaning(String drycleaning) {
        this.drycleaning = drycleaning;
    }

    public String getPickupnotes() {
        return pickupnotes;
    }

    public void setPickupnotes(String pickupnotes) {
        this.pickupnotes = pickupnotes;
    }

    public String getPackage() {
        return Package;
    }

    public void setPackage(String aPackage) {
        Package = aPackage;
    }
}
