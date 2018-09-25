import DAO.AdminDAO;
import DAO.ChooseServiceDAO;
import DAO.UserDAO;
import Model.CustomWashDetails;
import Model.Customer;
import Model.Order_table;
import Model.Payment;

import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) throws SQLException, ParseException {
        Boolean userisregistering = false;

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        String[] laundrypackage =  {"natural laundry package","customwash package"};

        String[] city = {"White Plains","Rye","Scarsdale","Sleepy Hollow","Tarrytown"};


        System.out.println(formatter.format(Date.valueOf(java.time.LocalDate.now())));





       // String str = formatter.format(calendar.getTime());

       // System.out.println(str);

        UserDAO userDAO = new UserDAO();
        Customer login_customer = null;
        Customer customer = new Customer();
        Scanner scanner = new Scanner(System.in);

        System.out.println("1: to register/n 2: to login");
        int regORlogin = scanner.nextInt();

        if(regORlogin == 1){
            userisregistering = true;

            System.out.println("plesese enter first name");
            customer.setFirstName(scanner.next());

            System.out.println("plesese enter last name");
            customer.setLastname(scanner.next());

            System.out.println("please enter email");
            customer.setEmail(scanner.next());

            System.out.println("please enter password");
            customer.setPassword(scanner.next());

            System.out.println("please enter phone");
            customer.setPhone(scanner.nextLong());
            scanner.nextLine();
            System.out.println("please enter street");
            customer.setStreet(scanner.nextLine());

            System.out.println("please enter a number for the city");
            int i = 0;
             for(String c: city){
                 i ++;
                 System.out.println(i+": "+c);
             }
            customer.setCity(scanner.nextInt());
             scanner.nextLine();

            System.out.println("please enter state");
            customer.setState(scanner.nextLine());

            System.out.println("please enter zip code");
             customer.setZip(Integer.parseInt(scanner.nextLine()));

            System.out.println("please enter type of building");
            customer.setType_of_building(scanner.next());


            login_customer = userDAO.register_customer(customer);


        }if(regORlogin ==2){
            System.out.println("please enter email");
            String email = scanner.next();
            System.out.println("please enter password");
            String password = scanner.next();

           login_customer = userDAO.login_user(email,password);

        }



       if(login_customer != null) {
           Order_table order_table = new Order_table();

           java.util.Date date = new java.util.Date();

           java.sql.Date sqlDate = new java.sql.Date(date.getTime());
           order_table.setDateorder(sqlDate);
           System.out.println("choose a package \n" +
                   " 1: natural care laundry package' \n" +
                   "2: custom care laundry");
           int num = scanner.nextInt() - 1;
           String packagename = laundrypackage[num];

           order_table.setLaundrycarepackage_id(num + 1);

           System.out.println("please enter 1 for drycleaning \n " +
                   "if you dont want drycleaning then press and other number");

           int dryclean = scanner.nextInt();

           if ((dryclean == 1)) {
               order_table.setDrycleaning(true);
           } else {
               order_table.setDrycleaning(false);
           }


           String[] time = {"am", "pm"};
           System.out.println("choose a pickuptime " +
                   "\n 1: pickup time 7 am to 12 pm \n" +
                   " 2: pickup time 6 pm to 10 pm");

           order_table.setPickup_time(time[scanner.nextInt() - 1]);

           System.out.println("choose a dropofftime " +
                   "\n 1: pickup time 7 am to 12 pm \n" +
                   " 2: pickup time 6 pm to 10 pm");

           order_table.setDropoff_time(time[scanner.nextInt() - 1]);

           System.out.println("Please choose a date for pickup");
           ArrayList<String> arrayListdate = new ArrayList<>();
           for (int i = 1; i < 7; i++) {
               Calendar calendar = Calendar.getInstance();
               calendar.add(Calendar.DAY_OF_YEAR, i);
               System.out.println(i + ": " + formatter.format(calendar.getTime()));
               arrayListdate.add(formatter.format(calendar.getTime()));
               calendar = null;
           }
           int x = scanner.nextInt();
           order_table.setPickupdate(arrayListdate.get(x));
           arrayListdate.clear();

           System.out.println("Please choose a date for drop off");
           int j = 1;
           x++;

           for (int i = x; i <= (x + 5); i++) {
               Calendar calendar1 = Calendar.getInstance();
               calendar1.add(Calendar.DAY_OF_YEAR, i);
               System.out.println(j + ": " + formatter.format(calendar1.getTime()));
               arrayListdate.add(formatter.format(calendar1.getTime()));
               calendar1 = null;
               j++;
           }
           order_table.setDropoffdate(arrayListdate.get(scanner.nextInt()));

           System.out.println("Personless pickup Y/N");
           String personlesspickup = scanner.next();
           if (personlesspickup.equalsIgnoreCase("Y")) {
               order_table.setPersonless_pickup(true);
           } else if (personlesspickup.equalsIgnoreCase("N")) {
               order_table.setPersonless_pickup(false);
           }

           System.out.println("Personless pickup Y/N");
           String personlessdropoff = scanner.next();
           if (personlessdropoff.equalsIgnoreCase("Y")) {
               order_table.setPersonless_pickup(true);
           } else if (personlessdropoff.equalsIgnoreCase("N")) {
               order_table.setPersonless_pickup(false);
           }

           scanner.nextLine();

           System.out.println("Please enter additional note on picking up your laundry");
           order_table.setPickupnotes(scanner.nextLine());

           System.out.println("please enter additional note on dropping off your laundry");
           order_table.setDropoffnotes(scanner.nextLine());


           // setpayment to order


           // set the customwash if user choose customwash
           boolean customwash = false;
           CustomWashDetails customWashDetails = new CustomWashDetails();
           if (packagename.equalsIgnoreCase("customwash package")) {
               String[] washtemp = {"Warm Wash", "Cold Wash"};

               System.out.println("set wash temperature for white clothes \n" +
                       "1: Warm Wash \n" +
                       "2: Cold Wash");
               customWashDetails.setWhitetemperature(washtemp[scanner.nextInt() - 1]);

               System.out.println("choose wash temperature for color clothes \n" +
                       "1: Warm Wash \n" +
                       "2: Cold Wash");
               customWashDetails.setColortemperature(washtemp[scanner.nextInt() - 1]);

               String[] Dryerheat = {"low dry", "Regular Dry"};
               System.out.println("set Dryer heat for color \n" +
                       "1: low dry \n" +
                       "2: Regular dry");
               customWashDetails.setColorheat(Dryerheat[scanner.nextInt() - 1]);

               System.out.println("choose Dryer heat for white \n" +
                       "1: low dry \n" +
                       "2: Regular dry");
               customWashDetails.setWhiteheat(Dryerheat[scanner.nextInt() - 1]);

               System.out.println("choose soap \n" +
                       "1: tide \n " +
                       "2: gain \n" +
                       "3: woolite");
               String[] soap = {"tide", "gain", "woolite"};
               customWashDetails.setSoapID(scanner.nextInt());

               System.out.println("choose softner \n" +
                       "1: Downy \n" +
                       "2: Honest");
               String[] softner = {"Downy", "Honest"};

               customWashDetails.setSoftnerID(scanner.nextInt());
               scanner.nextLine();
               customwash = true;
           }


           ChooseServiceDAO chooseServiceDAO = new ChooseServiceDAO();


           int payment_id = 0;
           boolean paymentdone = false;
           if (userisregistering) {
               Payment payment = new Payment();
               System.out.println("please enter billing name");
               payment.setBillingname(scanner.nextLine());
               System.out.println("please enter credit card number");
               payment.setCredit_card_number(scanner.nextLong());
               scanner.nextLine();
               System.out.println("please enter expire date");
               payment.setExpire_date(scanner.next());
               System.out.println("please enter payment type");
               payment.setPaymenttype(scanner.next());

               payment_id = chooseServiceDAO.insertpayment(payment);
               paymentdone = true;

           } else {
               List<Payment> paymentList = chooseServiceDAO.userpayments(login_customer.getCustomerID());
               //int i = 0;
               int m = 0;
               System.out.println("please enter the number");
               ArrayList<Payment> list = new ArrayList<>();
               for (int o = 0; o < paymentList.size(); o++) {
                   m = 0;
                   for (int i = 0; i < paymentList.size(); i++) {

                       if (paymentList.get(o).getCredit_card_number() == paymentList.get(i).getCredit_card_number()) {
                           m++;

                       }

                   }
                   if (m > 1) {
                       list.add(paymentList.remove(o));
                   }

               }

               System.out.println("list = " + list);
               for (Payment payment : list) {
                   System.out.println(payment.getCredit_card_number());
               }

//            String convertostring = String.valueOf(payment.getCredit_card_number());
//            System.out.println(i +" Billing name: " + payment.getBillingname() + "last 3 digits of credit card number: "
//                    + convertostring.substring(convertostring.length()-3) + "expired date: " + payment.getExpire_date());
//            i ++;
               payment_id = chooseServiceDAO.insertpayment(list.get(scanner.nextInt() - 1));
               paymentdone = true;
           }
           if (paymentdone) {
               // step 1; get the customer id; step 2; add the customer id to the order table
               order_table.setCustomerid(login_customer.getCustomerID());

               // step 3; set the payment id to the order_table then insert the order table to the db and return order id;
               order_table.setPayment_id(payment_id);
               int orderid = chooseServiceDAO.insert_order(order_table);

               //add the order_id to the customwashdetails table and insert to the customwashdetails db
               if (customwash) {
                   customWashDetails.setOrder_ID(orderid);
                   chooseServiceDAO.insertinto_customwashdetails(customWashDetails);
               }

           }
       }

        if(regORlogin == 3){

            while (true){
                System.out.println("please enter the username for admin");
                String user = scanner.next();
                System.out.println("please enter the pass for admin");
                String pass = scanner.next();
                boolean adminDAO = new AdminDAO().loginAdmin(user,pass);
                if(!adminDAO) {
                    System.out.println("sorry incorrect user or pass");
                    System.out.println("please try again");

                }else {
                    break;
                }
            }
            while (true) {

                System.out.println("please enter what date you would like to see for pickup");

                System.out.println("a list of user for pickup on ");

                System.out.println();
            }



        }







    }
}
