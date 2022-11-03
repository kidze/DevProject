public class AnimalLocator {
    public static String getAnimalNameById(Integer id){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        String r = '';
        if(response.getStatusCode() == 200){
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            Map<String, Object> animals = (Map<String, Object>) results.get('animal');
            System.debug('Received the following animal: '+animals);
            r = String.valueOf(animals.get('name'));
            System.debug('String received: '+r);
        }
        return r;
    }
}