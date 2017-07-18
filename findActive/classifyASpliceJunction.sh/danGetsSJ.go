package main

import (
	"fmt"
)

func main() {
	//t := [4]byte{'A', 'C', 'G', 'T'}

	b := []byte{0, 0, 0, 0}

	var n int
	//var t int
	dispfn := func() {
		//for i, sub := range b {
		//	switch sub {
		//	case 0:
		//		b[i] = 'T'
		//	case 1:
		//		b[i] = 'A'
		//	case 2:
		//		b[i] = 'C'
		//	case 3:
		//		b[i] = 'G'
		//	}
		//}
		//fmt.Printf("%c, %c, %c, %c\n", b[0], b[1], b[2], b[3])
		n++
		fmt.Printf("%v %v %v %v   %v\n", b[0], b[1], b[2], b[3], n)

	}

	var fn func(pos int, val byte)
	fn = func(pos int, val byte) {
		//	fmt.Println("entering senior")
		if pos >= len(b) {
			return
		}
		if pos >= 0 && pos < 4 {
			b[pos] = val
			//			fmt.Println("entering display")
			dispfn()
		}
		for i := byte(0); i < 4; i++ {
			//		fmt.Println("entering junior")
			//	fmt.Println("current:", pos+1, i)
			fn(pos+1, i)

		}
	}

	fn(-1, 0)
	fmt.Println(n)
}
