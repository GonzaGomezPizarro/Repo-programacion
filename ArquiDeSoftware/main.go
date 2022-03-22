package main

import (
	"errors"
	"fmt"
)

func division(a, b float32) (float32, error) {
	if b == 0 {
		errorr := errors.New("No se puede dividir por cero")
		return 999999, errorr
	}
	var res float32 = a / b
	return res, nil
}

func div(a, b int) (int, int) {
	return a / b, a % b
}

func main() {

	var dividendo, divisor float32 = 10, 3

	div, err := division(dividendo, divisor)

	if err != nil {
		fmt.Println("Error: ", err, "  |  Division: ", div)
	} else {
		fmt.Println("Resultado: ", div, "  |  Error: ", err)
	}

}
