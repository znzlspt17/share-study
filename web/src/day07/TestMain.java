package day07;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class TestMain {
	public static void main(String[] args) {
		ArrayList<Integer> list = new ArrayList<Integer>();

		list.add(142);
		list.add(142);
		list.add(142);
		list.add(150);
		list.add(151);
		list.add(152);

		Map<Integer, Integer> map = new HashMap<Integer, Integer>();
		map.put(150, 1);
		for (int x : list) {
			if (map.containsKey(x)) {
				map.put(x, map.get(x) + 1);
			} else {
				map.put(x, 1);
			}
		}
	}
}
