

import org.junit.Test;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class PasswordHash {

	@Test
	public void testBCryptHash(){
		String password = "secret";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);
		System.out.println(hashedPassword);
	}
	
	
	@Test
	public void testMD5Hash() {
		String password = "secret";
		Md5PasswordEncoder passwordEncoder = new Md5PasswordEncoder();
		String hashedPassword = passwordEncoder.encodePassword(password, null);
		System.out.println(hashedPassword);
	}

}
