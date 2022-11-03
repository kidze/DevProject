public class StringArrayTest{
	public static List<String> generateStringArray(Integer test){
		List<String> r = new List<String>();
		for(Integer i=0; i<test; i++){
			r.add('Test '+i);
		}
		return r;
	}
}