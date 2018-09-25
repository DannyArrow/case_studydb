package Model;

import java.sql.Date;

public class CustomerInArea {

  private int total;
  private String city;
  private Date deliverydate;
  private String delivery_time;
  private String driver;
  private int driverID;
  private  int CityID;



    public CustomerInArea(){

  }

    public CustomerInArea(int total, String city, Date deliverydate, String delivery_time, String driver, int driverID, int cityID) {
        this.total = total;
        this.city = city;
        this.deliverydate = deliverydate;
        this.delivery_time = delivery_time;
        this.driver = driver;
        this.driverID = driverID;
        CityID = cityID;
    }

    public int getDriverID() {
        return driverID;
    }

    public void setDriverID(int driverID) {
        this.driverID = driverID;
    }

    public int getCityID() {
        return CityID;
    }

    public void setCityID(int cityID) {
        CityID = cityID;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Date getDeliverydate() {
        return deliverydate;
    }

    public void setDeliverydate(Date deliverydate) {
        this.deliverydate = deliverydate;
    }

    public String getDelivery_time() {
        return delivery_time;
    }

    public void setDelivery_time(String delivery_time) {
        this.delivery_time = delivery_time;
    }

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }


}
