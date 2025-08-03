
Adaptive Filtering: Simulation Analysis and Comparison of LMS and RLS Algorithms
================================================================================

Project Title:
--------------
Simulation Analysis and Comparison of Tracking Performance of Adaptive Algorithms

Authors:
--------
- Kaleab Zemenay (336561)
- Gashaw Yimer (336548)

Institution:
------------
Warsaw University of Technology
Faculty of Electronics and Information Technology
Graduate Program (MSc) – Telecommunications

Project Description:
--------------------
This project presents a comprehensive simulation-based analysis of two widely used adaptive 
filtering algorithms—Least Mean Squares (LMS) and Recursive Least Squares (RLS)—to evaluate 
and compare their tracking performance in time-varying systems. The work investigates how both 
algorithms respond to three types of system changes: abrupt, exponential, and linear.

The simulations are implemented in MATLAB and focus on measuring:
- Error Trajectory
- Mean Squared Error (MSE)
- Convergence Rate
- Filter Coefficient Stability

Algorithms Studied:
-------------------
1. LMS (Least Mean Squares)
   - Simpler and computationally efficient
   - Slower adaptation with small step-size α
   - Sensitive to parameter tuning for stability and convergence

2. RLS (Recursive Least Squares)
   - Fast adaptation and accurate tracking
   - Performance heavily dependent on forgetting factor λ
   - λ = 0.95 found to be optimal in balancing speed and accuracy

Experiments:
------------
Simulations include:
- Abrupt Change in filter parameters
- Exponential Change modeled by growth factor 'a'
- Linear Change modeled by slope 'm'

Each case is analyzed with multiple values of algorithm parameters (α for LMS, λ for RLS) 
over 1000 realizations. Metrics are plotted and steady-state values are compared.

Key Findings:
-------------
- LMS with a small α has lower error but slower convergence.
- RLS with λ = 0.95 outperforms others in balancing tracking speed and accuracy.
- Systems with λ = 1 in RLS fail to track dynamic changes.
- Gradual parameter growth (small 'a' or 'm') makes convergence harder for both algorithms.

Files Included:
---------------
- main_simulation.m       – MATLAB script for running simulations
- lms_algorithm.m         – LMS implementation
- rls_algorithm.m         – RLS implementation
- plot_results.m          – Visualization of results
- report.pdf              – Full academic report

How to Run:
-----------
1. Open MATLAB and navigate to the project folder.
2. Run main_simulation.m to generate all simulation results.
3. Use plot_results.m to visualize specific scenarios.

References:
-----------
- Adaptive Signal Processing Lectures (EASP L6–L8)
- Adaptive Signal Processing Labs (EASP Lab 2–3)
