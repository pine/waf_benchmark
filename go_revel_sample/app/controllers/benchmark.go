package controllers

import (
	"github.com/revel/revel"
	"math"
	"time"
)

type Benchmark struct {
	*revel.Controller
}

type SimpleResult struct {
	Ok        bool   `json:"ok"`
	Language  string `json:"language"`
	Framework string `json:"framework"`
	Now       int64  `json:"now"`
}

type PrimeResult struct {
	Ok     bool `json:"ok"`
	Max    int  `json:"max"`
	Result int  `json:"result"`
}

func Prime(max int) int {
	var table []bool = make([]bool, max)
	var i_max = int(math.Sqrt(float64(max))) + 2

	if max < 3 {
		return -1
	}

	// init table
	table[0] = true // 0 is not prime number
	table[1] = true // 1 is not prime number

	// make table
	for i := 2; i < i_max; i++ {
		if !table[i] {
			for j := i + i; j < max; j += i {
				table[j] = true
			}
		}
	}

	// search
	for i := max - 1; i < max; i-- {
		if !table[i] {
			return i
		}
	}

	return -1
}

// GET /benchmark/simple
func (c Benchmark) Simple() revel.Result {
	result := SimpleResult{
		Ok:        true,
		Language:  "Go",
		Framework: "Revel",
		Now:       time.Now().Unix(),
	}

	return c.RenderJson(result)
}

// GET /benchmark/cpu?max=100000
func (c Benchmark) Cpu(max int) revel.Result {
	result := PrimeResult{
		Ok:     true,
		Max:    max,
		Result: Prime(max),
	}

	return c.RenderJson(result)
}
