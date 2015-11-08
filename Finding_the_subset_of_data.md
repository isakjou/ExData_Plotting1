<ol>
<li>Read the first lines of the file.<br>
<code>data <- read.table(file, header = TRUE,  sep = ";", na.strings = "?", nrows = 5)<code>
The first date is 16/12/2006 17:24:00 and each row is increment by one minute, i.e. the next rows are 16/12/2006 17:25:00, 16/12/2006 17:26:00, and so on.
</li>
<li>Find the minutes between 2006-12-16 17:24:00 and 2007-02-01 00:00:00<br>
Declare two datetime variables for these dates and use difftime\(\)
<code>t1 <- strptime("2015-12-16 17:24:00","%Y-%m-%d %H:%M:%S")
 t2 <- strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S")
 difftime(t2,t1)
</code>
The result is:
<code>Time difference of 46.275 days</code>
Convert to minutes:
<code>46.275 * 24 * 60 = 66636</code>
Plus 1 because are we include the initial minute 2006-12-16 17:24:00</li>
<li>Calculate the minutes in two days
<code>2 * 24 * 60 = 2880</code></li>
<li>Read the subset to use.
<code>data <- read.table(file, header = FALSE,  sep = ";", na.strings = "?", nrows = 2880, skip = 66637)</code></li>
</ol>
