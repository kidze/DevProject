@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String[] r = ParkLocator.country('USA');
        // Verify that a fake result is returned
        System.assertEquals('Yen1', r[0]);
        System.assertEquals('Yen2', r[1]);
        System.assertEquals('Yen3', r[2]);
    }
}