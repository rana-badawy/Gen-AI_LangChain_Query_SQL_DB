# Define few-shot examples for training the model
few_shots = [
    {
        "input": "What is the price of all white small skirts we have in inventory",
        "query": "select sum(price*stock_quantity) from products where product_type = 'Skirt' and color = 'white' and size = 'S'"
    },
    {
        "input": "How many Adidas black t-shirts do we have left",
        "query": "select sum(stock_quantity) from products where product_type = 'T-shirt' and brand = 'Adidas' and color = 'Black'"
    },
    {
        "input": "how many levi black shorts do we have",
        "query": "select sum(stock_quantity) from products where product_type = 'Shorts' and color = 'Black' and brand = 'Levi'"
    },
    {
        "input": "If we have to sell all the Levi’s T-shirts today with discounts applied, how much revenue will our store generate?",
        "query" : """SELECT sum(a.total_amount * ((100-COALESCE(discounts.pct_discount, 0))/100)) as total_revenue from
        (select sum(price*stock_quantity) as total_amount, product_id from products where brand = 'Levi' and product_type = 'T-shirt'
        group by product_id) a left join discounts on a.product_id = discounts.product_id"""
    },
    {
        "input" : "If we have to sell all the Levi’s T-shirts today, how much revenue will our store generate without discount?",
        "query": "SELECT SUM(price*stock_quantity) FROM products WHERE brand = 'Levi' and product_type = 'T-shirt'"
    },
    {
        "input": "how much sales amount will be generated if we sell all large size t-shirts today in nike brand after discounts?",
        "query" : """SELECT sum(a.total_amount * ((100-COALESCE(discounts.pct_discount, 0))/100)) as total_revenue from
        (select sum(price*stock_quantity) as total_amount, product_id from products where brand = 'Nike' and product_type = 'T-shirt' and size = 'L'
        group by product_id) a left join discounts on a.product_id = discounts.product_id"""
    }
    ]