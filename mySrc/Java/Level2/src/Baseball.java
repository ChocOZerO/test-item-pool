
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;


public class Baseball {
    
    private static List<Integer> getComputerNum() {
        List<Integer> computer = new ArrayList<Integer>();
        while (computer.size() < 3) {
            int newNum = (int)(Math.random() * 9) + 1;
            if (!computer.contains(newNum)) {
                computer.add(newNum);
            }
        }
        Collections.shuffle(computer);
        return computer;
    }
    
    private static Map<String, Integer> countResult(Map<String, Integer> result,
            List<Integer> computer, String[] guessNum) {
        for (int i = 0; i < guessNum.length; i++) {
            int num = Integer.parseInt(guessNum[i]);
            if (num == computer.get(i)) {
                result.put("strike", result.get("strike") + 1);
            } else if (computer.contains(num)) {
                result.put("ball", result.get("ball") + 1);
            }
        }
        return result;
    }
    
    private static void printResult(Map<String, Integer> result) {
        String strResult = "";
        int strike = result.get("strike");
        int ball = result.get("ball");
        
        if (strike > 0) strResult += strike + " 스트라이크 ";
        if (ball > 0) strResult += ball + " 볼";
        
        if (strike == 0 && ball == 0) strResult += "낫싱";
        
        System.out.println(strResult);
    }
    
    public static void main(String[] args) {
    	
        List<Integer> computer = getComputerNum();
        Map<String, Integer> result = new HashMap<>();
        result.put("strike", 0);
        result.put("ball", 0);
        
        System.out.println("숫자야구게임");
        
        Scanner sc = new Scanner(System.in);
        while (result.get("strike") != 3) {
            System.out.println("1부터 9사이의 숫자로 이루어진 세자리 숫자를 입력해주세요.");
            String strGuessNum = sc.nextLine();
            if (strGuessNum.length() != 3) {
                continue;
            }
            String[] guessNum = strGuessNum.split("");
            result.put("strike", 0);
            result.put("ball", 0);
            result = countResult(result, computer, guessNum);
            printResult(result);
        }
        System.out.println("성공! 축하드립니다!");
        sc.close();
    }
}