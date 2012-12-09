import java.security.InvalidKeyException;
import java.security.Key;
 
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
 
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
 
public class LocalEncrypter{
    //DESede �� ��ȣȭ�� ���Ǵ� �ִ� Ű ����� �����ϴ� Ű������ : ��������� ���� ��ũ
    private static String algorithm = "DESede";
    private static Key    key       = null;
    private static Cipher cipher    = null;
 
    public static String returnEncryptCode(String str) throws Exception {
        byte [] encryptionBytes = null;
       
        setUp();
              
        // �Է¹��� ���ڿ��� ��ȣȭ �ϴ� �κ�
        encryptionBytes = encrypt( str );
        BASE64Encoder encoder = new BASE64Encoder();
         String encodeString = encoder.encode(encryptionBytes);
         //encoder.encode(encryptionBytes) ���� encrypt �� �� ���
        return encodeString;
    }

   private static void setUp() throws Exception {
        key = KeyGenerator.getInstance( algorithm ).generateKey();
        cipher = Cipher.getInstance( algorithm );
    }

    public static String returnDecryptCode(String str) throws Exception {
        BASE64Decoder decoder = new BASE64Decoder();
        String decode = decrypt( decoder.decodeBuffer(str) );
        return decode;
    }
 
    // encryptionBytes = encrypt( input ), input�� �����Ͽ� encryptionBytes�� ������.
    private static byte [] encrypt(String input) throws InvalidKeyException, BadPaddingException, IllegalBlockSizeException  {
        cipher.init( Cipher.ENCRYPT_MODE, key );
        byte [] inputBytes = input.getBytes();
        return cipher.doFinal( inputBytes );
    }
 
    //decrypt( decoder.decodeBuffer(encodeString) ) ó���κ�.
    private static String decrypt(byte [] encryptionBytes) throws InvalidKeyException, BadPaddingException, IllegalBlockSizeException {
        cipher.init( Cipher.DECRYPT_MODE, key );
        byte [] recoveredBytes = cipher.doFinal( encryptionBytes );
        String recovered = new String( recoveredBytes );
        return recovered;
    }
 
}