# davidson_incidents

Mapping and segregation of Nashville incident data set.

The notebook canbe run step-by-step to exwecute the desirable results.


Result 1: Incident heatmap of Davidson county

Result 2: 4 hourly, daily, and monthly incident rates in Davidson county


Added the Poission Regression model of predicting the incident rates

The updated notebook contains the mean-error for all the grids - data being taken month-wise for a total of 50 months<br><br>
The Poisson regression on kmeans clustered (clusters=3) data is added.

Computed p-median for all the grids, based on historical incident data, using CPLEX. The number of required median points is chosen as 3. 
The data generated is transferred to the notebook and plotted.
Added the CPLEX code and config files
