These codes realize data transformation and simple data processing for fault diagnosis.

If you want to analysis the data automatically, we need Setting the parameters in Pars_Seeting!!!!!!!!

If you want to analysis the data one by one, we should use the file with single!!!!!!!!

% The code will only test on matlab2016b. 

% ----------------------------------------------------------------------
% Permission to use, copy, or modify this software and its documentation
% for educational and research purposes only and without fee is here
% granted, provided that this copyright notice and the original authors'
% names appear on all copies and supporting documentation. This program
% shall not be used, rewritten, or adapted as the basis of a commercial
% software or hardware product without first obtaining permission of the
% authors. The authors make no representations about the suitability of
% this software for any purpose. It is provided "as is" without express
% or implied warranty.
%----------------------------------------------------------------------


Attention:
the analysing folder can not contain any other .txt which is not related to the channels information


Additionally!!!
We will continue to add new algorithms to the this codebook for furthering vibration signal processing.

Made by Zhibin Zhao, Baoqing Ding, Shuming Wu , Baijie Qiao, Weiluo, Zhixian Shen, Dong He
State Key Laboratory for Manufacturing Systems Engineer
Xi'an Jiaotong University
Date: 2017.06.19

If you have some new ideas or any confusion, please contact us without hesitation !!! 
Email : zhaozhibin@stu.xjtu.edu.cn





Function Details
STFT : fast STFT not using any loop
Polynomial_chriplet : Polynomial chriplet transform
polylsqr : fitting of a polynomial
Do_PCT : Iteratively using PCT to achieve best solution
Cal_Index : Calculate the Index of time domain for dimensional and non-dimensional
Cal_Plot : This function realizes calculating , ploting and save the figure
Calculatingbearing : calculating the eigenfrequency of bearing 
Data_Convert : This function realizes Converting the data
DisplaySTFT : Display the spectrogram in the specified range
Dofft : Calculating the fft of the signal
Hilbert_envelope : Calculating the Hilbert envelope spectrum of the signal
jet_Linchao : Variant of HSV
MakeWindows : Make artificial Window so it will be tight frame
MakeWindowsTF : Make artificial Window so it will be tight frame
Rms_Estimate : This function realizes calculating , ploting and save the Rms_Comparison figure
Pars_Setting : Setting some constant parameters
Fast_STFT_SST_Matrix_ZoomNoRecon : Fast zoomed Synchrosqueezing Transform








