package main1

import "fmt"

func Hello() {
	fmt.Print("Hello")
	fmt.Println(" World!")
}

func Max(a, b, c int) int {
	var max int

	if a <= b {
		max = b
	} else {
		max = a
	}

	if max < c {
		max = c
	}

	return max
}

func Add(a, b int) int {
	x := a + b
	return x
}

func Add1_10() int {
	sum := 0
	for i := 1; i < 11; i++ {
		sum += i
	}
	return sum
}

func Balance() [3]int {
	var x = [3]int{1, 2, 3}
	var y [3]int
	var y1 [3]int
	for i := 0; i < 3; i++ {
		fmt.Scan(&y[i])
	}
	for i := 0; i < 3; i++ {
		y1[i] = x[i] + y[i]
	}
	return y1
}

func Mapping() {
	m := make(map[string]string)

	m["首都"] = "北京"
	m["时间"] = "2022年1月23日09:41:19"

	s1 := make([]int, 0) //0为长度
	s2 := []int{1, 2, 3}

	fmt.Println("Map:", m)
	fmt.Println("Slice1:", s1)
	fmt.Println("Slice2:", s2)
}

func Fibonacci(n int) int {
	if n > 2 {
		return Fibonacci(n-1) + Fibonacci(n-2)
	}
	return 1
}

func Hased() {
	passwd := "1231231"
	hasedpasswd := []byte(passwd)
	fmt.Println(passwd, ":", hasedpasswd)
}
