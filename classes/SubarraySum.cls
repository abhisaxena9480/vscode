public class SubarraySum {  
    public static void printAllSubsetsRec(integer []arr, integer n, List<integer> v,  integer sum)  {   
        if (sum == 0) {  
            for (integer i=0;i<v.size();i++)  
                System.debug( v[i]);   
        }  
         if (n == 0)   
        printAllSubsetsRec(arr, n - 1, v, sum);  
        List<Integer> v1=new List<Integer>(v); 
        v1.add(arr[n - 1]);  
        printAllSubsetsRec(arr, n - 1, v1, sum - arr[n - 1]);  
    }  
    
    public static void printAllSubsets(integer []arr, integer n, integer sum)  
    {  
        List<Integer> v= new List<Integer>();  
        printAllSubsetsRec(arr, n, v, sum);   
    }
    public static void main() {  
        Integer [] arr=new Integer[]{1,2,3,4,5};  
            integer sum = 10;  
        integer n = arr.size();  
        printAllSubsets(arr, n, sum);  
        
    } 
}