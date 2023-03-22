import java.util.Scanner;
public class Fibonacci {
   public static void main(String[] args) {
       int number = 10;
       int a = 0;
       int b = 1;
      
       int sum = 0;
      
       System.out.println("Serie de Fibonacci en DH");
       System.out.print(a + " " + b + " ");
      
       for( int i = 2; i < number ; i++ ){
          
           sum = a + b;
          
           a = b;
           b = sum;
          
           System.out.print(sum + " ");
       }
    }
}
