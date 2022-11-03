public class ParkLocator {
    public static String[] country(String c){
        ParkService.ParksImplPort ps = new ParkService.ParksImplPort();
        return ps.byCountry(c);
    }
}