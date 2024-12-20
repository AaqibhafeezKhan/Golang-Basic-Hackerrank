
---

### **2. R: Tweets Sentiment Analysis**

Complete a function to clean a Twitter data annotation done for a firm and analyze the given data.

#### Input Data
You are given a data frame consisting of the following fields:
- **tweet_id**: a unique identifier associated with each data point.
- **tweet_text**: the textual data associated with the tweet.
- **tweet_sentiment**: the sentiment label for the tweet, either "positive", "negative" or "neutral".

---

### **Data Cleaning Steps**
1. Drop all the punctuation in the tweet text.
2. Convert the tweet text to lower case English letters.
3. Split the tweet text into separate words and trim the leading and trailing spaces in each word.
4. Remove all the words with a length less than 5 or greater than 10.

---

### **Output**
Report a data frame consisting of four fields:
- **word**: the set of different words in the data set.
- **positive**: 1 if the word was used in a tweet with positive sentiment at least once, or 0 otherwise.
- **neutral**: 1 if the word was used in a tweet with neutral sentiment at least once, or 0 otherwise.
- **negative**: 1 if the word was used in a tweet with negative sentiment at least once, or 0 otherwise.

**Note**: Due to memory constraints, you should only report your results for the following words:
- `"fashion"`, `"dress"`, `"clothes"`, `"shirt"`

---

### **Function Description**
Complete the function `tweets_sentiment_analysis` in the editor below.

The function has the following parameter:
- `df_data`: file with data about tweets.

---

### **Constraints**
- Use basic R functions.

---

### **Input Format For Custom Testing**
Each line in the `csv` file presents one tweet.

---

#### **Sample Case 0**

**Sample Input:**
```csv
"tweet_id","tweet_text","tweet_sentiment"
"4bb91a2437","poor girl","negative"
"654e6d5d4f","Yeah but it doesn't sound indie enough I need2learn some other tunes and then pick up on the 'style' 1 hour I'll c u then jm","neutral"
"ec6e70ffdd","Hey beautiful","positive"
"653acb287f","I shudder at the thought of what she was thinking she'd do with it if she'd managed to reclaim it.","neutral"
"25268d0c6c","Who is this and is he famous? Don't know if I can read/finish clothes. Maybe","neutral"
"14a234d610","My grandma was telling me how they used to cut up human bodies to save space when there was no room in the car","negative"
"53af22e22f","I'm looking forward to tonight's dinner date with Mom; is giving this another try Kudos kanin' (less rice) movement; is","neutral"
```

**Sample Output:**
```csv
"word","positive","neutral","negative"
"clothes",0,1,0
"dress",0,0,0
```

**Explanation**:  
Process data according to the problem statement.

---

#### **Sample Case 1**

**Sample Input:**
```csv
"tweet_id","tweet_text","tweet_sentiment"
"8ca5b813a7","This is the meanest little boy ever!!!!!!!!!! When I was a lil girl everyone loved me.","neutral"
"ea9e8770fd","Beautiful","positive"
"55af62f641","Somebody get me out of work tomorrow.","neutral"
"ce42b6dd7d","Ran into them and it last night, watched it again","positive"
"caa9735c4f","Haha yeah, I just want to ask, you hooked up with somebody at "neutral"
```

**Sample Output:**
```csv
"word","positive","neutral","negative"
"shirt",1,0,0
"shoes",0,1,0
```

**Explanation**:  
Process data according to the problem statement.

--- 

