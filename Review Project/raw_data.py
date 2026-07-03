## This is the data that we want to insert some data 
review = [
    {
        "negative": "This is very bad product i ordered one month ago",
        "positive":"This product is vry nicr go for it",
        "bad_product":["Shoes","Cricket Bat"],
        "good_products":["Books","Mobiles phone"]
    },
]

## write the clean data that we want to insert
with open("review.txt","w") as file:
    file.write(f"positive: {review[0]['positive']}\n")
    file.write(f"good products: {', '.join(review[0]['good_products'])}\n")