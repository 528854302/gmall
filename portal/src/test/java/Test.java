import org.apache.ibatis.logging.stdout.StdOutImpl;

import java.util.AbstractList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;

/**
 * @ClassName Test
 * @Description: TODO
 * @Author 528854302@qq.com
 * @Date 2020/9/4
 **/
public class Test {
    private int a=0;
    public static void main(String[] args){


    }

    public static int changeStr(String word1,String word2){
        int len1 = word1.length();
        int len2 = word2.length();
        int[][] DP = new int[len1+1][len2+1];
        for(int i = 0; i <= len2; i++){
            DP[0][i] = i;
        }
        for(int i = 0; i <= len1; i++){
            DP[i][0] = i;
        }

        for(int i = 1; i <= len1; i++)
            for(int j = 1; j <= len2; j++){
                if(word1.charAt(i-1) == word2.charAt(j-1)) {
                    DP[i][j] = DP[i-1][j-1];
                } else {
                    int add = DP[i-1][j] + 1;
                    int del = DP[i][j-1] + 1;
                    int upd = DP[i-1][j-1] + 1;
                    DP[i][j] = Math.min(Math.min(add,del),upd);
                }

            }
        return DP[len1][len2];
    }


    //111000111101
    //"aaabbaaacc"
    public static int get(String str){
        StringBuilder temp=new StringBuilder("");
        HashSet<String> set = new HashSet<>();
        for (int i = 0; i < str.length(); i++) {
            if (i<str.length()-1 && str.charAt(i)==str.charAt(i+1)){
                if ("".equals(temp.toString())){
                    temp.append(str.charAt(i)).append(str.charAt(i+1));
                }else {
                    temp.append(str.charAt(i+1));
                }
            }else if (i==str.length()-1 && str.charAt(i-1)!=str.charAt(i)){
                set.add(""+str.charAt(i));
            }
            else {
                set.add(temp.toString());
                temp=new StringBuilder("");
            }
        }
        int setSize = set.size();
        int total=0;
        Iterator<String> iterator = set.iterator();
        while (iterator.hasNext()){
            String next = iterator.next();
            total+= next.length();
            System.out.println(next);
        }
        return total/setSize;
    }
}

