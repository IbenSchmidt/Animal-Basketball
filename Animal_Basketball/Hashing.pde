import java.security.*;
String davs;

String hashText(String input_text) {
  try {
    MessageDigest md = MessageDigest.getInstance("SHA-256"); 
    md.update(input_text.getBytes());    
    byte[] byteList = md.digest();
    StringBuffer hashedValueBuffer = new StringBuffer();
    for (byte b : byteList)hashedValueBuffer.append(hex(b)); 
    println(hashedValueBuffer.toString());
    return hashedValueBuffer.toString();
  }
  catch (Exception e) {
    System.out.println("Exception: "+e);
  }
  return "";
}
