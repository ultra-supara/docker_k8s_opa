//todo: データの中から2020年以降に出版された本があるかどうか調べたい時の手続き型言語による実装

function published_after_2020(books) {
    for (let i = 0; i <= books.length; i++) {
        if (books[i].year >= 2020) return true
    }
    return false
}

//todo: 別の実装例を記述する
const published_after_20200 = books =>
    books
        .filter(book => book.year >= 2020)
        .length !== 0
