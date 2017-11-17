# Basic-Rotating-Machine-Vibration-Analysis
These codes realize data transformation and simple data processing for fault diagnosis.

If you want to analysis the data automatically, we need Setting the parameters in Pars_Seeting!!!!!!!!

If you want to analysis the data one by one, we should use the file with single!!!!!!!!


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

Function
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

