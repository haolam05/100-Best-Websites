How did I deal with extraneous urls or other problems in the input data?

***Extraneous urls***
My strategy is to find the uniquess of these 100 urls compared to the urls above and below the table.
I realized that only urls inside the "100 Websites List" are bold. Bold text is generated using <strong> tag.
Thus, I used grep to select all lines that have a <strong> tag before "http://".
Finally, I stored the files into an output file

***Isolating urls***
After isolating these 100 urls(in preserved ranking order), I used sed substitution to replace everything before and after
the urls inside the output file with an empty string.

***Plotting***
I decided to use EPSViewer to open the scatterplot.eps file through this command:
	xdg-open scatterplot.eps
The scatterplot.eps file should be set with the default open with "EPSViwer" for this to work.

***Websites that are not response***
I realized that it took too long to wait for the website to response. And some websites never responses.
The reason for this is because wget default tried 20 times before giving up.
I specified the number of tries to be 1 to reduce the wait time.