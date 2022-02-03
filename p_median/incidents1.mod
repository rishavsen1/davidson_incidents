
// P-Median Probelm
main{
	// Generating & Solving initial model
	thisOplModel.generate(); // Generating the current model instance
		if (cplex.solve())
		{
		var ofile = new IloOplOutputFile("C:/Users/risha/OneDrive - Vanderbilt/Vanderbilt University/Research work/Programs/Geo/CLPEX/outputs/Answer2.txt");
  		ofile.writeln(thisOplModel.printSolution());
  		ofile.writeln("Solving CPU Elapsed Time  in (Seconds): ", cplex.getCplexTime());
  		ofile.close();
		var obj = cplex.getObjValue();
		writeln("The Value of the Objective Function Value is (Total Weighted distance): ", obj);
		writeln("Solving CPU Elapsed Time  in (Seconds): ", cplex.getCplexTime()); 
		thisOplModel.postProcess(); 
		}
	else {
			writeln("No Solution");	
		 } 
	}
	
// indicies
{int} sheds =...;  
{int} grids =...;  

// Parameters and Data
int max_shedsP =...;  
float demand[grids] =...;  
float distance[sheds][grids]=...;  

// Decision Variables
dvar boolean Open[sheds];  
dvar boolean Assign[sheds][grids];  

// Model 

// Total demand weighted distance
minimize  sum(w in sheds, c in grids) distance[w][c]*demand[c]*Assign[w][c]; 
    
subject to{

  forall ( c in grids) 
    EachgridsdemandMustBeMet:
    	sum( w in sheds ) Assign[w][c]==1;	
  
    UseMaximum_P_sheds:
  	sum(w in sheds) Open[w]==max_shedsP;
  
    forall (w in sheds, c in grids)
    CannotAssignCustomertoWH_UnlessItIsOpen:
      Assign[w][c] <= Open[w];
}