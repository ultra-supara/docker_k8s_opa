package ramen

test_good_ramen_shop {
    is_good_ramen_shop with input as {
        "name": "おいしいラーメン屋",
        "rating": 5.0
    }
}

test_normal_ramen_shop {
    is_good_ramen_shop with input as {
        "name": "ふつうのラーメン屋",
        "rating": 3.0
    }
}

test_bad_ramen_shop {
    not is_good_ramen_shop with input as {
        "name": "ふつうのラーメン屋",
        "rating": 3.0
    }
}
