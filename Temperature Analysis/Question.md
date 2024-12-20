
---

### **1. R: Temperature Analysis**

In this task, you are required to analyze weather data about the temperature in the given region from three different data sources and calculate the average temperature by years and months.

#### Input Data Frame
The input data frame consists of three fields:
- **source**: the ID of the data source, either 1, 2, or 3.
- **date**: the date of the temperature recording.
- **temperature**: the recorded temperature in degrees Celsius ranging from -10° to +30°.

#### Output
Report a data frame with the following fields:
- **source**: the ID of the source.
- **year**: the year corresponding to which the data point is evaluated.
- **month**: the month corresponding to which the data point is evaluated.
- **temperature_mean**: the average temperature in the particular year and month according to the corresponding source.

**Note**: The results should be sorted ascendingly by source, year, and month. The average temperature should be rounded to two digits after the decimal point.

---

#### **Function Description**
Complete the function `calculate_average_temperature` in the editor below.

The function has the following parameter:
- `df_data`: file with data about temperature observations.

---

#### **Constraints**
- Use basic R functions.

---

### **Input Format For Custom Testing**
Each line in the `csv` file represents one temperature observation.

---

#### **Sample Case 0**

**Sample Input:**
```csv
"source","date","temperature"
1,"2018-01-10 11:35:57 CET",4
2,"11-01-2018",20
2,"08-01-2018",30
2,"20-01-2018",10
3,"06-01-2018",14
3,"20-01-2018",17
3,"2018-01-10 11:35:57 CET",5
3,"2018-06-10",19
```

**Sample Output:**
```csv
"source","year","month","temperature_mean"
1,2018,1,4
2,2018,1,20
3,2018,1,12
3,2018,6,19
```

**Explanation**:  
Process data according to the problem statement.

---

#### **Sample Case 1**

**Sample Input:**
```csv
"source","date","temperature"
1,"2011-08-01 11:41:06 CET",-3
1,"2011-08-01 11:41:06 CET",27
1,"2011-08-01 11:41:06 CET",-2
1,"2011-08-01 11:41:06 CET",-1
3,"2011-12-09",26
3,"2011-12-09",24
3,"2011-12-09",17
3,"2011-12-10",-1
3,"2011-12-10",2
3,"2011-12-10",3
3,"2011-12-19",-1
3,"2011-12-19",24
```

**Sample Output:**
```csv
"source","year","month","temperature_mean"
1,2011,8,7.7
3,2011,12,11.0
```

**Explanation**:  
Process data according to the problem statement.

--- 

