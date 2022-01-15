package test;

public class dan {

    // 함수는 자신을 호출한 지점에 리턴값을 남긴다.
    public static void main(String[] args) {
        // printDan(4); 정해진 단 출력

        for (int dan = 2; dan < 10; dan++) {
            printDan(dan);
            System.out.println();
        }
    }

    public static void printDan(int dan) {

        for (int i = 1; i < 10; i++) {
            System.out.println(dan + "*" + i + "=" + (dan * i));
        }

    }

}
