package main;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class Main {
  public static void main(String[] args) {
    Scanner in = new Scanner(System.in);
    Map<String, Integer> env = new HashMap<>();

    while (in.hasNextLine()) {
      String line = in.nextLine();
      String[] split = line.split(" ");
      env.put(split[0], Integer.valueOf(split[2]));
    }

    System.out.println(env);
  }
}
