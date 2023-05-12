package book

books := [
	{
		"title": "10s book",
		"year": 2021
	},
	{
		"title": "shame book",
		"year": 2020
	},
	{
		"title": "rego book",
		"year": 2019,
	}
]

published_after_2020 {
	book := books[_]
    book.year >= 2020
}

# ポリシーの評価結果
# {
#    "published_after_2020": true
# }
