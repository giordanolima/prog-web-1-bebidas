package TADSBD;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Utils {

    public static String md5(String str) throws NoSuchAlgorithmException {
        String r = "";
        MessageDigest md = MessageDigest.getInstance("MD5");
        BigInteger hash = new BigInteger(1, md.digest(str.getBytes()));
        r = hash.toString(16);			
        return r;
    }
    
}
