README [last updated 31-January-2022]

This dataset is from the paper titled
    "How to outrun your parasites (or mutualists): symbiont transmission mode is key"
    By: Allison K. Shaw

    Published in: TBD

Contact ashaw@umn.edu for assistance.

This directory contains three types of files:


(1) Matlab code (.m) files:

  run_simulation.m: Simulates a host population with unpartnered (U) and partnered (P)
     individuals that is spreading out across space.

  do_transmission_ana.m: Analytic forms of the number of unpartnered (U) and
      partnered (P) host individuals across many nodes (x locations) in a system with
      infection at rate beta with density-dependent, frequency-dependent, or
      saturating (type II) transmission
   
  fft_conv.m: Convolution and polynomial multiplication

  fig2_plot.m: plots figure 2 in the paper

  fig3_runsims.m: runs simulations needed for figure 3 in the paper and saves the
    output as fig3_stype=1.mat and fig3_stype=2.mat

  fig3_plot.m: opens fig3_stype=1.mat and fig3_stype=2.mat and plots figure 3 in the
     paper

  fig4_runsims.m: runs simulations needed for figure 4 in the paper and saves the
    output as fig4_AE.mat, fig4_beta.mat and fig4_v.mat

  fig4_plot.m: open fig4_AE.mat, fig4_beta.mat and fig4_v.mat and plots figure 4 in
    the paper
    
  figS1_plot.m: plots figure S1 in the paper
    
  figS2_plot.m: plots figure S2 in the paper
    
  figS3_plot.m: opens fig3_stype=1.mat and fig3_stype=2.mat and plots figure S3 in
     the paper
   
  figS4_plot.m: open fig4_AE.mat, fig4_beta.mat and fig4_v.mat and plots figure S4
    in the paper
    
 (2) Matlab data (.mat) files:

  fig3_stype=1.mat: output from fig3_runsims.m, for stype=1
  
  fig3_stype=2.mat: output from fig3_runsims.m, for stype=2
  
  fig4_AE.mat: output from fig4_runsims.m, varying the Allee effect threshold
  
  fig4_beta.mat: output from fig4_runsims.m, varying transmission (beta)
  
  fig4_v.mat: output from fig4_runsims.m, varying dispersal (v)
  
 
(3) Image (.jpg) files:
 
  fig2.jpg: image of figure 2 in the manuscript
  
  fig3.jpg: image of figure 3 in the manuscript
  
  fig4.jpg: image of figure 4 in the manuscript
 
  figS1.jpg: image of figure S1 in the manuscript

  figS2.jpg: image of figure S2 in the manuscript

  figS3.jpg: image of figure S3 in the manuscript

  figS4.jpg: image of figure S4 in the manuscript

