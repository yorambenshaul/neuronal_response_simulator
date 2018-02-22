# neuronal_response_simulator
The goal of the Neuronal response simulator is to provide insights about how response features (with a focus on temporal parameters), 
affect the ability to determine stimulus identity from neuronal response. 
The simulator allows specification of responses of a neuronal population to two different stimuli (stimulus A and B). 
Responses of each neuron can differ in their time course, and in their magnitudes.
Once a population is defined, it is possible to visualize the PSTHs, view the discriminability in responses, 
and to conduct classification analysis on the dataset. The program also creates data files with the simulated responses, 
allowing application of other analyses not built-in into the code. 

Note that while the simulator does allow specification of a very large number of scenarios, it is by no means comprehensive in its ability
to simulate any type of response. Furthermore, the simulator does not allows specifying properties of individual neurons,
but rather of a population. The possibilities and constraints are described below. 

Note also that the simulator only includes minimal input checking and error reporting.
It is the users’ responsibility to enter valid (and reasonable) values into the interface. 

The code is written in MATLAB

Yoram Ben-Shaul 2/2018
