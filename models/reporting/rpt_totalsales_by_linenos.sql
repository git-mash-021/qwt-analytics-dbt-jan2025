
{{config(materialized='view',schema='reporting')}}


{% set linenumbers =get_order_linenos() %}

 select orderid, 
    {% for linenum in linenumbers %}
        sum(case when lineno={{linenum}} then linesalesamount else 0 end) as line{{linenum}}_sales,
    {% endfor %}       
        sum(linesalesamount) as total_amount
    from {{ref("fct_orders")}}
group by orderid

/* select orderid, 
    {% for lineno in [1,2,3] %}
        sum(case when lineno={{lineno}} then linesalesamount else 0 end) as line{{lineno}}_sales,
    {% endfor %}       
        sum(linesalesamount) as total_amount
    from staging_salesmart.fact_orders
group by orderid */

/*   select lineno, 
        sum(case when lineno=1 then linesalesamount else 0 end) as lineno1_sales,
        sum(case when lineno=2 then linesalesamount else 0 end) as lineno2_sales,
        sum(case when lineno=3 then linesalesamount else 0 end) as lineno3_sales,
        sum(linesalesamount) as total_sales
    from staging_salesmart.fact_orders
group by lineno */
