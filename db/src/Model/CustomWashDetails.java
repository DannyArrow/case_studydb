package Model;

public class CustomWashDetails {

    private int Order_ID;
    private  String whitetemperature;
    private String colortemperature;
    private String colorheat;
    private String whiteheat;
    private int soapID;
    private int softnerID;


    public int getOrder_ID() {
        return Order_ID;
    }

    public void setOrder_ID(int Order_ID) {
        this.Order_ID = Order_ID;
    }

    public String getWhitetemperature() {
        return whitetemperature;
    }

    public void setWhitetemperature(String whitetemperature) {
        this.whitetemperature = whitetemperature;
    }

    public String getColortemperature() {
        return colortemperature;
    }

    public void setColortemperature(String colortemperature) {
        this.colortemperature = colortemperature;
    }

    public String getColorheat() {
        return colorheat;
    }

    public void setColorheat(String colorheat) {
        this.colorheat = colorheat;
    }

    public String getWhiteheat() {
        return whiteheat;
    }

    public void setWhiteheat(String whiteheat) {
        this.whiteheat = whiteheat;
    }

    public int getSoapID() {
        return soapID;
    }

    public void setSoapID(int soapID) {
        this.soapID = soapID;
    }

    public int getSoftnerID() {
        return softnerID;
    }

    public void setSoftnerID(int softnerID) {
        this.softnerID = softnerID;
    }
}
