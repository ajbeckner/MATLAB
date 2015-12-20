%this is Anthony Beckner's first Bi-weekly assignment for section 87
%%first question 1
%first we set up the variables given
Resistance = [50 100 150 200 300 400 500];
Voltage = [120 120 120 120 120 120 120];
efficiency = [80 81 83 85 89 87 84];%efficiency is in percents
%then we calculate the others (Current, power)
Current = Voltage ./Resistance;
Power = Current .*Voltage;      
%the factor of .01 serves to modify the  percents numbers of efficiency
%into decimals in the line below
Heat = efficiency .* Power .*(.01);
clear ans;
%%all that's left is the plotting
figure(1);
plot(Resistance,Heat,'ro-');
hold on %keeps plot for other lines
plot(Resistance,Current,'bd-');
plot(Resistance,Power,'g*-');
legend('Heat','current','Power')%creates legend for all three
clc
%%start problem 2
%then we start the second assignment by entering the data from excel
NFLX11 = [178.41
181.37
179.73
177.99
179.3
187.88
186.65
188.9
191.49
191.48
193.68
190.87
185
182.09
183.96
186.74
183.03
210.87
217.98
214.08
212.9
211.26
211.49
220.07
218.02
217.62
222.29
223.2
231.07
247.55
240.79
237.72
235.63
235.51
221.6
211.2
215.18
212.44
206.67
204.63
204.23
203.37
210.72
207.4
195.45
192.99
200.02
204.54
201.2
217.11
213.84
213.9
209.4
212.84
221.39
229.06
229.13
230.01
237.32
237.38
237.95
237.78
242.09
244.72
244.23
239.97
233.96
234.86
228.16
233.92
238.75
236.73
235.49
233.33
241.55
244.43
252.22
251.67
228.91
235.96
234.37
232.67
237.19
231.24
229.19
230.31
229.47
236.41
237.63
240.67
245.77
246.52
237.09
236.94
242.54
242.73
245.9
247.83
247.6
259.47
263.75
264.51
270.8
267.26
271.7
273.7
262.59
263.69
262.26
262.57
258.62
257.22
261.13
257.12
249.3
245.67
245.63
253.65
248.66
255.72
256.96
260.12
265.09
264.94
262.69
267.99
289.63
290.96
292.42
295.14
290.74
291.27
298.73
286.62
286.93
279
287.29
281.4
275.81
276.58
281.53
266.91
269.42
266.62
265.99
263.38
256.26
260
245.77
241.11
226.64
237.8
232.42
243.13
244
246.28
239.04
232.24
217.48
205.21
205.21
219.54
216.03
215.83
221.89
225.04
236.28
235.01
233.27
213.11
218.77
216
211.2
203.97
210.05
208.75
208.71
169.25
155.19
143.75
130.03
128.5
128.53
129.36
132.22
127.49
127.14
113.19
113.27
113.25
114.9
119.76
123.24
117.21
111.62
108.66
113.62
117.01
116.04
117.33
111.74
109.42
111.48
117.04
118.84
77.37
79.4
80.86
84.14
82.08
80.09
83.39
92.29
90.02
90.83
90.47
88.05
85.12
87.75
85.72
86.28
81.18
76.46
78.06
74.47
70.45
68.5
63.86
69.95
67.57
64.53
67.17
66.37
70.12
68.14
71.96
69.42
70.89
75.26
72.11
71.04
69.72
69.82
67.15
71.4
70.97
73.84
72.62
70.6
69.2
69.3
69.29];
%and the second set of data
NFLX13 = [92.01
96.59
95.98
99.2
97.16
95.91
98
101.29
103.44
101.69
97.48
97.7
99.17
97.81
103.26
146.86
169.56
162.11
169.12
167.7
165.24
164.8
174.74
174.39
184.41
181.96
180.97
177.89
177.95
186.27
187.4
189.51
196.45
187.12
187.15
179.86
179.32
184.09
184.32
188.08
189.37
181.21
181.73
182.94
181.56
184.7
180.45
182.11
192.36
188.37
184.85
185.59
181.37
183.05
181.99
181.3
180.79
190.61
190.24
189.28
182.43
176.69
169.74
166.69
164.66
163.06
169.36
166.07
173.01
173.2
176.5
175.85
169.36
163.82
163.37
174.37
216.99
216.72
213.75
215.55
215.01
216.07
212.91
214.49
213.45
210.69
206.25
208.61
216.41
217.69
229.38
233.97
243.4
237.03
239
239.55
237.09
228.56
226.18
228.74
214.19
215.34
222.66
226.25
221.97
225.31
223.46
217.74
220.22
220.93
214.46
207.64
215.39
213.99
229.23
228.83
232.31
223.52
216.9
215.6
212.9
212.1
214.97
211.09
224.28
221.46
220.91
225.1
233.1
247.38
243.82
244.17
257.26
257.98
260.48
267.92
266.41
264.58
261.96
250.26
241.3
246.74
246.31
244.96
243.76
244.48
249.12
246.18
253.84
255.9
249.21
250.4
252.75
256.6
259.19
261.81
253.41
258.87
259.78
273.29
270.37
269.75
278.36
282.72
276.04
283.36
287.85
283.91
289
292.43
295.11
291.54
294.15
313.06
308.3
301.41
305.65
302.16
299.55
306.92
305.5
313.83
306.49
307.14
313.51];
clc
%%then we use the datapoints for analysis
%use the size command to determine the number of datapoints
DataPoints11 = size(NFLX11)
DataPoints13 = size(NFLX13)
%then calculate the min,max,range,mean,std deviation,and variance with appropriately named variables
Lowerbound11 = min(NFLX11)
Upperbound11 = max(NFLX11)
Range11 = range(NFLX11)
Avg11 = mean(NFLX11)
StandardDeviation11 = std(NFLX11)
Variance11 = var(NFLX11)
Lowerbound13 = min(NFLX13)
Upperbound13 = max(NFLX13)
Range13 = range(NFLX13)
Avg13 = mean(NFLX13)
StandardDeviation13 = std(NFLX13)
Variance13 = var(NFLX13)
%%lastly we plot and generate histograms
figure(2)%creates diagram
plot(NFLX11,'g-');
hold on%keeps figure1 for second plot
plot(NFLX13,'b-');
legend('NFLX11','NFLX13');%let's you know which line is which
title 'NFLX stock prices';
xlabel 'days';
ylabel 'price';
figure(3)%creates second diagram
hist(NFLX11)%generates first histogram
title 'NFLX11 prices';
xlabel 'prices';
ylabel 'data points';
handle = findobj(gca,'Type','patch');%these two lines
set(handle,'FaceColor','g','EdgeColor','w');%change the color of the histogram
figure(4)%creates third diagram
hist(NFLX13)%generates second histogram
title 'NFLX13 prices'
xlabel 'prices'
ylabel 'data points'
clc
%%data analysis
%the stock reached its peak in 2011 due to the increasing popularity of the
%service
%(according to wikipedia) shortly thereafter the prices plummeted when
%Netflix made a decision to separate the company in two
%in 2013 netflix's stock prices seem to have taken off again following
%consumption of tablets and other devices that can strem tv from netflix
%late in the year netflix finally passed its peak once again surviving
%complete ruin.
