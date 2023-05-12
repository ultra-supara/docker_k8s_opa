# refarence : https://www.openpolicyagent.org/docs/latest/policy-language/
package ramen

ramen_shops := [{
	"name": "おいしいラーメン屋",
	"rating": 4.5
}, {
	"name": "そこそこのラーメン屋",
	"rating": 3.2
}, {
	"name": "微妙なラーメン屋",
	"rating": 1.5
}, {
	"name": "近所のラーメン屋",
	"rating": 2.5
}, {
	"name": "遠くのラーメン屋",
	"rating": 3.1
}]

goodramen_shops[ramen_shop.name] {
    ramen_shop := ramen_shops[_]
    ramen_shop.rating >= 3.0
}
