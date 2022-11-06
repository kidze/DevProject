public with sharing class BusScheduleCache {
    private Cache.OrgPartition part;
    public BusScheduleCache() {
        Cache.OrgPartition getpart = new Cache.OrgPartition('local.BusSchedule');
        if(getpart != null){
            part = getpart;
        }
        //part = Cache.Org.getPartition('local.BusSchedule');
    }
    public void putSchedule(String busLine, Time[] schedule){
        if(part != null)
            part.put(busLine, schedule);
    }
    public Time[] getSchedule(String busLine){
        Time[] s = new List<Time>();
        Object g = part.get(busLine);
        if(g == null){
            Time t1 = Time.newInstance(8, 0, 0, 0);
            s.add(t1);
            Time t2 = Time.newInstance(17, 0, 0, 0);
            s.add(t2);
        }else{
            s = (Time[])g;
        }
        return s;
    }
}