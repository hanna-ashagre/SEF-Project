import static javax.swing.JOptionPane.*;
//eyosi's comment
String nameofcenter= "Dr.Amanuel Hospital";
String choose;
String phoneNumber;
String name;
String address;
String age;
String sex;
int date=day();
int month=month();
int year=year();
String queuePath = str(date)+"-"+str(month)+"-"+str(year);
String newqueue;
String table_path="Patients.csv";
String sequence_path = "Sequence_"+queuePath+".csv";
Table currentTable, sequenceTable;
Table table;
File queue;
void setup() {
  currentTable = loadTable(table_path, "header");
  sequence_path = dataPath(sequence_path);
  queue = new File (sequence_path);
  println(queue.exists());

  if (queue.exists()) {
    sequenceTable = loadTable(sequence_path, "header");
  } else {
    sequenceTable=new Table();
  }

  choose=showInputDialog("Well Come To Dr.Amanuel Hospital \n 1. card\n2. detail");
  if (choose.equals ("1") || choose.equals ("2")) {
    if (int(choose)==1) {
      // phoneNumber = " " + showInputDialog("Please enter your phone number\"with +country code\" ");      
      int rIndex = currentTable.findRowIndex (phoneNumber, 0);
      boolean isNew = rIndex == -1;

      if (isNew == false) {
        showMessageDialog(null, "to register please pay 50ETB by telebirr.Then send the transaction code ");

        String validt="ABC";
        String tranc=showInputDialog("Please Enter Transaction code");
        tranc=tranc.toUpperCase();
        if (tranc.equals(validt)) {

          name =currentTable.getRow(rIndex).getString("Phone number");
          age =currentTable.getRow(rIndex).getString("Name");
          address =currentTable.getRow(rIndex).getString("Address");
          sex =currentTable.getRow(rIndex).getString("Age");
          phoneNumber =currentTable.getRow(rIndex).getString("Sex");
          save_patient_info(sequenceTable, phoneNumber, name, address, age, sex, sequence_path);
          println(sequenceTable.getString(0, 0));
          // int  order=sequenceTable.findRowIndex(name, 1);
          showMessageDialog(null, "Payment Is Success.there are some registrants before you");
        } else {
          showMessageDialog(null, "error tansaction code");
        }
      } else {
        // New patients
        phoneNumber =showInputDialog("please enter your phoneNumber \"with + country code \" ");
        name =showInputDialog("Please enter your full name ");
        address =showInputDialog("Please enter your address ");
        age=showInputDialog("Please enter your age ");
        sex=showInputDialog("Please enter your sex(F/M) ");

        // phonenumber = phonenumber.substring(1,phonenumber.length());
        showMessageDialog(null, "please pay 50 birr for service in telebirr.then send transaction code!");

        String transaction=showInputDialog("please enter your transaction code");
        String tranv="SEL";
        if (transaction.equals(tranv)) {
          save_patient_info( currentTable, phoneNumber, name, address, age, sex, table_path); 
          save_patient_info (sequenceTable, phoneNumber, name, address, age, sex, sequence_path);

          // println(sequenceTable.getString(1,0));
          //int sorder=sequenceTable.findRowIndex(name, 1);

          showMessageDialog(null, "Payment Is Success.there are some registrants before you");
        } else
        {
          showMessageDialog(null, "error tansaction code");
        }
      }
    } else if (int(choose)==2) {
      String  detail=showInputDialog("1. address\n2. service");

      if (int(detail)==1) {

        showMessageDialog(null, "our address // bishoftu, evangelical");
      } else if (int(detail)==2) {
        showMessageDialog(null, "Yemnsetachew Agelglotoch\n1. lewust dewe\n2.le cheguara\n3. kanget belay hikmina\n4. le tirf anget ");
      } else {
        showMessageDialog(null, "error number");
      }
    } else

      showMessageDialog(null, "error number please try again");
  }
}
void save_patient_info(Table table, String  phonenumber, String name, String address, String age, String sex, String path ) {
  if (path.equals(table_path)||(queue.exists())&&path.equals(sequence_path)) {
    println ("Here 1", path);
    TableRow new_info = table.addRow();
    new_info.setString("Phone number", phonenumber);
    new_info.setString("Name", name);
    new_info.setString("Address", address);
    new_info.setString("Age", age);
    new_info.setString("Sex", sex);
    println("file saved!");
    saveTable(table, path );
  } else {
    println ("Here 2", path);
    //sequenceTable=new Table();
    TableRow new_info=table.addRow();
    new_info.setString("Phone number", phonenumber);
    new_info.setString("Name", name);
    new_info.setString("Address", address);
    new_info.setString("Age", age);
    new_info.setString("Sex", sex);
    saveTable(table, path );
  }
}
/////////
