public class subsetsArray {
    public static void addNo(){
        Integer [] a=new Integer[]{1,2,3,4,5};
            System.debug('a:'+a);
        integer sum = 10;
        for(integer i=0; a[i]<a.size();i++){
            if(a[i]+a[i+1]==10){
                System.debug('values:'+a[i]+a[i+1]);
            }
        }
    }
    public static void addNo1(){
        Integer sum = 0;
        List <Integer > arr = new List<Integer>{1,2,3,4,5}; 
            integer size = arr.size();
        while(size > 0){
            for(Integer i = 0; i<size ; i++) {
                sum = sum + arr[i];
            }
            if(sum==10){
            	System.debug('Total:' + sum);
            }
            sum = 0;
            size = size -1;
        }
    }
}