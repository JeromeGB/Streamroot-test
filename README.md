# Streamroot-test

<h2>Foreword</h2>
Although I was very happy and excited to work on this test due to my interest for data science and computing and also to my motivation to do this internship with your company, I was only able to spend very limited time on this assignement. Indeed, having several large exams next week, I unfortunately had to prioritise my revisions. This being said, I believe I still managed to extract some relevant information from the data. To do so, I wrote a hasted (syntax could be much improved) MATLAB script which can be found on this repository.

<h2>Tech choices</h2>
I chose MATLAB to explore the data given in this test. Indeed, it is the language and ecosystem I am the most familiar with, and it has useful features for analysing data such as many matrix-related built in functions. Also, the .mat containers allow to open the csv file once, store the relevant information in different matrices and vectors, which can then directly be re-opened in MATLAB, making it quicker to analyse the file many times. Also, it offers many tools to visualise the data quickly (graphs etc). Finally, with more time, I would have liked to try the neural networking capabilities offered by MATLAB, although I am not certain it would be relevant for this specific example.

<h2>Exploration approach</h2>
From my discussion with Charles Sonigo and the information on Streamroot's website, I understood that the most important parameter is the p2p to cdn ratio. Indeed, ideally, largest possible contribution should be obtained from peers, as this is the key for scalable, fast, and low cost distribution that Streamroot is promoting. An important parameter is also the connection to the backend, as these connections would also, from what I understand, limit the scalability of the distribution.
I therefore decided to try to identify which parameter (browser, ISP and stream source) has the most impact on the performance, but also which browsers/isp/streams needed to be worked on and optimised.
Consequently, I decided to 'split' the data to independently analyse the performance impact of the browser, the isp and the stream. To quantify the performance, I introduced a merit index, normalised to the highest performer for each category. This technique is used a lot in material science for material selection which could almost be associated to data science as it consists of exploring large material databases. Normalising merit indices is useful as it allows to quickly see the disparity in %. Here, my proposed merit factor is <i> M=Average p2p/total ratio * proportion of users not connected to the backend </i>. This merit factor is not ideal, as it treats both parameters as having an equal impact on performance which is most likely not the case, however I had no information available regarding the impact of both, and it still gives a good indicator of which stream is performing well. It is also worth noting that the difference between the normalised merit function and simply taking the normalised average peer to peer ratio is minimal here.

<h2>Results</h2>
The results I obtained appear interestingly contrasted:
<ul>
  <li>As shown in the figure, the parameter that caused the most variation in performance was the source stream, with streams 3 and 4 behaving particularly badly in comparison with the others.</li>
  <li>Performance was significantly (around 20%) better with the web browser EarthWolf than with Iron.</li>
  <li>While Arange and BTP performed very similarly, Fro gave on average a 20% increase in merit index.</li>
</ul>

<img src="http://i.imgur.com/N5hLqYw.png" width="650" height="450">

To try to understand if the performance of a stream was related to the proportion of ISPs or web browsers used by viewers, I compared these metrics for the best performing stream (2) and the worse performing stream (3). As seen in the following figures, the proportions were almost identical in both cases. This suggests that the performance variation from stream to stream is only due to the stream itself, and not other parameters. It is therefore certain that the biggest source of performance difference is the stream itself. 

<img src="http://i.imgur.com/dkTDU1H.png" width="400" height="300">
<img src="http://i.imgur.com/vm7jbtA.png" width="400" height="300">
<img src="http://i.imgur.com/CRXaVnr.png" width="400" height="300">
<img src="http://i.imgur.com/4PTxYVd.png" width="400" height="300">

This result however is also slightly confusing. If we extrapolate the similarity in proportion of ISPs and browsers for all streams, the performance differences within browsers and ISPs should not exist. To try to see if the streams were indeed equally distributed for all ISPs, I decided to compare the traffic for the two ISPs which had the closest merit indices, Arange and BTP (on the graph 'dataX' corresponds to stream n°X).

<img src="http://i.imgur.com/Krglkyi.png" width="400" height="300">
<img src="http://i.imgur.com/taozpfW.png" width="400" height="300">

It is clear that the proportion of ISPs is therefore not so consistent for all streams. It is therefore still possible that the streams themselves are the source of most variations in performance. A more thourough analysis, for all streams, would be needed to determine the true impact of the browser and the ISP on performance.

I also realised that stream 3 had twice as many viewers as stream 2. Therefore I tried to identify if there was a correlation between number of viewers and performance. As visible on the following figure, no such trend can be seen in our data. The number of viewers can therefore be discarded as a cause for bad performance.

<img src="http://i.imgur.com/sRpOoA1.png" width="650" height="450">

My data-driven recommendations from this quick analysis would therefore be, in order of priority:
<ol>
  <li>Try to identify what causes the dramatic drops in performance for streams 3 and 4 (length? resolution? bit rate? codec?). </li>
  <li> Work on optimising the streams to give them properties closer to streams 1,2 and 9. However, it is possible that some of this performance loss is due to the nature of the streams (resolution/frames per second) which might not be easily changed.</li>
  <li>Try to understand what causes why the performance is decreased with Iron (simply a consequence of poor streams being viewed by the users or effect of the browser itself?). (My knowledge of video streaming is very limited, so I would not really know what could cause this variation in performance, although I suppose it could perhaps be due to the implementation of the video player in the browser).</li>
  <li>Try to work with the ISPs to understand why the performance is increased with Fro (simply a consequence of good streams being viewed by the users or effect of the ISP itself?).</li>
</ol>

<h2>Limitations and improvements</h2>
As mentioned previously, this study was done in a very limited time, and therefore restricted to the most basic information that can be extracted from the data set. Indeed, while we have identified that the stream itself probably has the biggest impact on peer to peer ratio, we have not studied how the parameters influenced each other (except very superficially for streams 2 and 3). With more time I would try to see if any pattern could be identified regarding the influence ISPs or browsers on performance. This would be particularly relevant for geographically locked content for example, as the performance of a stream in a country could be vastly different to the performance of a similar stream in a different country due to the differences in ISPs. However, one must keep in mind that the while the use of a normalised merit index improves the clarity of graphs, it also exagerates the actual differences in performance.

I would also have enjoyed exploring MATLAB's Neural Clustering or Pattern Recognition app, although I am not certain any meaninful results could have been obtained from it - but being prepared for unexpectede correlations. Indeed, neural networks are probably going to be increasingly important in data science and I would be curious to see how they could be used for 'simple' data treatment examples such as this one.

With more time, I would also clean up my code to make it more efficient, elegant and readable, and would add more comments for increased redability. Finally, if the analysis had to be repeated many times, I would consider writing the script in a compiled language that would be much faster than MATALB that can be quite slow.
