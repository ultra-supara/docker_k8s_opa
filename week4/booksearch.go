// todo: データの中から2020年以降に出版された本があるかどうか調べたい時の静的型付け言語による実装
package main

type Book struct {
	Title string
	Year  uint
}

func publishedAfter2020(books []Book) bool {
	for _, book := range books {
		if book.Year >= 2020 {
			return true
		}
	}
	return false
}
