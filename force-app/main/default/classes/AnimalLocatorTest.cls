@isTest
public class AnimalLocatorTest {
    @isTest static void AnimalLocatorTestMock(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String r = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('chicken',r);
    }
}