1.
/*
In MySQL, the equivalent function to add a time interval to a date is `DATE_ADD()`. Here's the correct syntax:

```sql
DATE_ADD(date, INTERVAL value unit)
```

- The `date` parameter specifies the date or datetime value to which the interval will be added.
- The `value` parameter represents the number of units to add or subtract. It can be a positive or negative integer.
- The `unit` parameter specifies the unit of time to be added or subtracted. It can be one of the following values:
  - `MICROSECOND`
  - `SECOND`
  - `MINUTE`
  - `HOUR`
  - `DAY`
  - `WEEK`
  - `MONTH`
  - `QUARTER`
  - `YEAR`

Here's an example using `DATE_ADD()` function in MySQL:

```sql
SELECT DATE_ADD('2023-06-20', INTERVAL 7 DAY) AS NewDate;
```

This query adds 7 days to the date '2023-06-20' and returns the new date as '2023-06-27'.
*/

2.

/*
In MySQL, you can use the `ROUND()` function to round a number to a specified number of decimal places. To round a number to three decimal places, you can use the following syntax:

```sql
ROUND(number, 3)
```

- The `number` parameter represents the value that you want to round.
- The `3` specifies the number of decimal places to which you want to round the `number`.

Here's an example that demonstrates rounding a number to three decimal places:

```sql
SELECT ROUND(12.3456789, 3) AS RoundedNumber;
```

The result of this query will be `12.346`, rounded to three decimal places.

Note that `ROUND()` function performs rounding according to standard rounding rules. If the decimal value is exactly halfway between two possible rounded values, it rounds to the nearest even number. For example, `ROUND(0.5)` would round to `0`, while `ROUND(1.5)` would round to `2`.
*/

3.

/*
In MySQL, the `FULL JOIN` syntax is not directly supported. However, you can achieve the same result using a combination of a `LEFT JOIN` and a `RIGHT JOIN`. Here's an example of how you can perform a `FULL JOIN` in MySQL:

```sql
SELECT *
FROM table1
LEFT JOIN table2 ON table1.id = table2.id
UNION
SELECT *
FROM table1
RIGHT JOIN table2 ON table1.id = table2.id;
```

In the above example, `table1` and `table2` are the two tables you want to join based on a common column `id`. The `LEFT JOIN` and `RIGHT JOIN` are combined using the `UNION` operator to get the result equivalent to a `FULL JOIN`.

The `LEFT JOIN` returns all rows from the left table (`table1`) and the matching rows from the right table (`table2`), while the `RIGHT JOIN` returns all rows from the right table and the matching rows from the left table. By combining the results of both joins using `UNION`, you will get the desired result of a `FULL JOIN`.

Note that if there are matching rows between the two tables, those will appear only once in the final result set. If there are non-matching rows in either table, they will also be included in the result.
*/


