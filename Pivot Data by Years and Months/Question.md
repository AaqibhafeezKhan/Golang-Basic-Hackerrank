
---

### **2. R: Pivot Data by Years and Months**

Given the sales data of an e-commerce company, your task is to analyze and report the monthly and yearly summary of the data.

---

### **Input Description**
You are given input data in the form of a data frame with three columns:
1. **order_id**: Unique identifier for the order.
2. **date**: A string in the format "yyyy-mm-dd".
3. **revenue**: A floating-point number representing the revenue for the order.

You need to return the following format:
- The first column should have a header `"Years"`. Each entry in this column should be years found in the dataset with the last entry as `"Mean"`.
- The remaining columns should have headings as distinct months found in the dataset in ascending order. Note that all months should be converted to their three-letter abbreviations (e.g., Jan, Feb, Mar, etc.).
- Each cell of the pivoted data frame should contain the sum of revenues corresponding to the month and year. The last row should contain the mean of revenues for the corresponding month.
- Each value should be rounded to the nearest integer.

---

### **Example Format**
```plaintext
Years    Jan    Feb    Mar    ...    Dec
2018    Sum of Jan 2018   ...   
2019    ...
Mean    Mean of Month ...
```

---

### **Function Description**
Complete the function `pivot_data_by_years_and_months` in the editor below.

This function has the following parameter:
- `df_orders`: an array of orders from the input file.

---

### **Constraints**
- Each data frame consists of no more than 1000 rows.
- The instructions are complete and data is valid.
- Do not make any assumptions beyond the problem statement.

---

### **Input Format for Custom Testing**
Each line in the `csv` file represents one order.

---

#### **Sample Case 0**

**Sample Input:**
```csv
"order_id","date","revenue"
"id01","2019-10-18",430
"id02","2018-05-19",150
"id03","2019-08-15",283
"id04","2020-06-23",402
"id05","2019-06-21",233
"id06","2018-02-10",112
"id07","2018-01-25",312
```

**Sample Output:**
```plaintext
"Year","Jan","Feb","Jun","Jul","Oct","Dec"
"2018",312,112,0,0,0,0
"2019",0,0,233,0,430,0
"2020",0,0,402,0,0,0
"Mean",59,188,212,0,143,37
```

**Explanation**:  
Process data according to the problem statement.

---

#### **Sample Case 1**

**Sample Input:**
```csv
"order_id","date","revenue"
"id01","2018-05-19",112
"id02","2019-06-21",161
"id03","2018-05-18",112
"id04","2020-08-25",420
"id05","2019-06-15",163
"id06","2018-05-18",224
"id07","2020-08-22",138
```

**Sample Output:**
```plaintext
"Year","Jan","Apr","Jun","Aug","Sep","Oct"
"2018",0,0,0,0,0,448
"2019",0,0,324,0,0,0
"2020",0,0,0,558,0,0
"Mean",165,143,219,66
```

**Explanation**:  
Process data according to the problem statement.

--- 

