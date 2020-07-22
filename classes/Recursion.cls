public class Recursion {
    public static void calucate() {   
        integer target = 10;
        integer sum1;
        integer sum2;
        integer sum3;
        integer sum4;
        integer sum5;
        Integer [] arr=new Integer[]{1,2,3,4,5}; 
            for(integer i =0; i < arr.size(); i++){
                sum1 = arr[i];
                if(sum1 == target){
                    System.debug('Results:'+arr[i]);
                }
                for(integer j = i+1; j<arr.size(); j++){
                    sum2 = arr[i]+arr[j];
                    if(sum2 == target){
                        System.debug('Results:'+arr[i] +' '+arr[j]);
                    }
                    for(integer k = i+2; k<arr.size(); k++){
                        sum3 = arr[i]+arr[j]+arr[k];
                        if(sum3 == target){
                            System.debug('Results:'+arr[i] +' '+arr[j] +' '+arr[k]);
                            break;
                        }
                        for(integer l = i+2; l<arr.size(); l++){
                            sum4 = arr[i]+arr[j]+arr[k]+arr[l];
                            if(sum4 == target){
                                System.debug('Results:'+arr[i] +' '+arr[j] +' '+arr[k]+' '+arr[l]);
                                break;
                            }
                            for(integer m = i+2; m<arr.size(); m++){
                                sum5 = arr[i]+arr[j]+arr[k]+arr[l]+arr[m];
                                if(sum5 == target){
                                    System.debug('Results:'+arr[i] +' '+arr[j] +' '+arr[k]+' '+arr[l]+' '+arr[m]);
                                }
                            }
                        }
                    }
                }
            }
    }
    public static void calucate1() {  
        Integer [] arr=new Integer[]{1,2,3,4,5}; 
            integer target = 10;
        integer a = arr[0];
        integer b = arr[1];
        integer c = arr[2];
        integer d = arr[3];
        integer e = arr[4];
        if(a+b == target)
            System.debug('Subset array:'+a+' '+b);
        if(a+c == target)
            System.debug('Subset array:'+a+' '+c);
        if(a+d == target)
            System.debug('Subset array:'+a+' '+d);
        if(a+e == target)
            System.debug('Subset array:'+a+' '+e);
        if(b+c == target)
            System.debug('Subset array:'+b+' '+c);
        if(b+d == target)
            System.debug('Subset array:'+b+' '+d);
        if(b+e == target)
            System.debug('Subset array:'+b+' '+e);
        if(c+d == target)
            System.debug('Subset array:'+c+' '+d);
        if(c+e == target)
            System.debug('Subset array:'+c+' '+e);
        if(d+e == target)
            System.debug('Subset array:'+d+' '+e);
        if(a+b+c == target)
            System.debug('Subset array:'+a+' '+b+' '+c);
        if(a+b+d == target)
            System.debug('Subset array:'+a+' '+b+' '+d);
        if(a+b+e == target)
            System.debug('Subset array:'+a+' '+b+' '+e);
        if(a+c+d == target)
            System.debug('Subset array:'+a+' '+c+' '+d);
        if(a+c+e == target)
            System.debug('Subset array:'+a+' '+c+' '+e);
        if(a+d+e == target)
            System.debug('Subset array:'+a+' '+d+' '+e);
        if(b+c+d == target)
            System.debug('Subset array:'+b+' '+c+' '+d);
        if(b+c+e == target)
            System.debug('Subset array:'+b+' '+c+' '+e);
        if(b+d+e == target)
            System.debug('Subset array:'+b+' '+d+' '+e);
        if(c+d+e == target)
            System.debug('Subset array:'+c+' '+d+' '+e);
        if(a+b+c+d == target)
            System.debug('Subset array:'+a+' '+b+' '+c+' '+d);
        if(a+c+d+e == target)
            System.debug('Subset array:'+a+' '+c+' '+d+' '+e);
        if(b+c+d+e == target)
            System.debug('Subset array:'+b+' '+c+' '+d+' '+e);
        if(a+b+c+d+e == target)
            System.debug('Subset array:'+a+' '+b+' '+c+' '+d+' '+e);
    }
}