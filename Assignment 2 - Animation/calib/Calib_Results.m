% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 995.506760401555312 ; 990.505889645718980 ];

%-- Principal point:
cc = [ 469.787614152473623 ; 646.377029264029375 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.136653377254744 ; -0.367720082851983 ; 0.000761813603910 ; 0.003887843452303 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 3.666852914324572 ; 3.674723583282710 ];

%-- Principal point uncertainty:
cc_error = [ 3.805515012544163 ; 4.314675389813484 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.008772897932668 ; 0.027950181998502 ; 0.001798274952724 ; 0.001318019553495 ; 0.000000000000000 ];

%-- Image size:
nx = 960;
ny = 1280;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 20;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ -2.299857e+00 ; -1.098914e+00 ; 8.303345e-01 ];
Tc_1  = [ -1.244402e+02 ; 6.573631e+01 ; 5.193356e+02 ];
omc_error_1 = [ 4.200507e-03 ; 2.793070e-03 ; 5.635237e-03 ];
Tc_error_1  = [ 1.971273e+00 ; 2.280722e+00 ; 1.872759e+00 ];

%-- Image #2:
omc_2 = [ -1.951759e+00 ; -1.386332e+00 ; 8.998164e-01 ];
Tc_2  = [ -5.968669e+01 ; -5.625192e+00 ; 4.748890e+02 ];
omc_error_2 = [ 3.782070e-03 ; 2.909772e-03 ; 5.455062e-03 ];
Tc_error_2  = [ 1.796471e+00 ; 2.054693e+00 ; 1.596325e+00 ];

%-- Image #3:
omc_3 = [ -2.507531e+00 ; -1.795622e+00 ; 3.242642e-01 ];
Tc_3  = [ -1.293363e+02 ; -7.216228e+01 ; 3.907412e+02 ];
omc_error_3 = [ 4.125134e-03 ; 2.514449e-03 ; 7.770252e-03 ];
Tc_error_3  = [ 1.471689e+00 ; 1.714610e+00 ; 1.693319e+00 ];

%-- Image #4:
omc_4 = [ 1.406372e+00 ; 1.414579e+00 ; -1.410224e+00 ];
Tc_4  = [ -3.369649e+01 ; 1.666667e+02 ; 5.912224e+02 ];
omc_error_4 = [ 3.404892e-03 ; 4.014376e-03 ; 4.512232e-03 ];
Tc_error_4  = [ 2.277503e+00 ; 2.609720e+00 ; 1.959945e+00 ];

%-- Image #5:
omc_5 = [ 1.868263e+00 ; 2.278099e+00 ; -1.078626e+00 ];
Tc_5  = [ 2.685198e+01 ; -2.631360e+01 ; 5.007972e+02 ];
omc_error_5 = [ 2.957479e-03 ; 4.184799e-03 ; 7.242618e-03 ];
Tc_error_5  = [ 1.890532e+00 ; 2.169520e+00 ; 1.679229e+00 ];

%-- Image #6:
omc_6 = [ -2.062614e+00 ; -1.970590e+00 ; 8.061440e-01 ];
Tc_6  = [ -1.697649e+01 ; -5.992597e+01 ; 4.504898e+02 ];
omc_error_6 = [ 3.481681e-03 ; 2.898859e-03 ; 7.090527e-03 ];
Tc_error_6  = [ 1.712853e+00 ; 1.938779e+00 ; 1.626257e+00 ];

%-- Image #7:
omc_7 = [ 2.012573e+00 ; 1.904819e+00 ; -9.255288e-01 ];
Tc_7  = [ -5.316833e+01 ; 3.302042e+01 ; 5.739151e+02 ];
omc_error_7 = [ 3.646757e-03 ; 4.086553e-03 ; 7.636862e-03 ];
Tc_error_7  = [ 2.175339e+00 ; 2.502030e+00 ; 1.992766e+00 ];

%-- Image #8:
omc_8 = [ 1.739473e+00 ; 1.712996e+00 ; -1.170936e+00 ];
Tc_8  = [ -4.322155e+01 ; 5.194062e+01 ; 5.945021e+02 ];
omc_error_8 = [ 3.283270e-03 ; 4.039064e-03 ; 5.978656e-03 ];
Tc_error_8  = [ 2.258951e+00 ; 2.588200e+00 ; 1.911859e+00 ];

%-- Image #9:
omc_9 = [ -2.115141e+00 ; -2.051756e+00 ; 4.530496e-01 ];
Tc_9  = [ -6.233367e+01 ; -7.211470e+01 ; 5.663802e+02 ];
omc_error_9 = [ 4.653681e-03 ; 4.364997e-03 ; 9.717424e-03 ];
Tc_error_9  = [ 2.149779e+00 ; 2.457069e+00 ; 2.267681e+00 ];

%-- Image #10:
omc_10 = [ -2.850319e+00 ; -1.188436e+00 ; 1.463988e-01 ];
Tc_10  = [ -1.688574e+02 ; 5.518793e+01 ; 5.010376e+02 ];
omc_error_10 = [ 6.271118e-03 ; 2.831767e-03 ; 9.579668e-03 ];
Tc_error_10  = [ 1.904936e+00 ; 2.224046e+00 ; 2.137660e+00 ];

%-- Image #11:
omc_11 = [ -2.400361e+00 ; -1.587771e+00 ; 2.357015e-01 ];
Tc_11  = [ -1.296126e+02 ; -1.252592e+02 ; 5.015027e+02 ];
omc_error_11 = [ 5.725111e-03 ; 3.006289e-03 ; 8.514784e-03 ];
Tc_error_11  = [ 1.913195e+00 ; 2.204275e+00 ; 2.190511e+00 ];

%-- Image #12:
omc_12 = [ -2.220449e+00 ; -1.887779e+00 ; 3.673738e-01 ];
Tc_12  = [ -7.888972e+01 ; -1.027159e+02 ; 4.347728e+02 ];
omc_error_12 = [ 4.169001e-03 ; 3.072035e-03 ; 7.540914e-03 ];
Tc_error_12  = [ 1.650117e+00 ; 1.882651e+00 ; 1.807197e+00 ];

%-- Image #13:
omc_13 = [ -2.066955e+00 ; -2.169550e+00 ; 5.520622e-01 ];
Tc_13  = [ -3.280859e+01 ; -6.896804e+01 ; 4.717650e+02 ];
omc_error_13 = [ 3.715329e-03 ; 3.894146e-03 ; 8.676163e-03 ];
Tc_error_13  = [ 1.790500e+00 ; 2.038037e+00 ; 1.847345e+00 ];

%-- Image #14:
omc_14 = [ 1.784176e+00 ; 2.582596e+00 ; -1.765480e-01 ];
Tc_14  = [ -2.921016e+01 ; -5.591041e+01 ; 5.183407e+02 ];
omc_error_14 = [ 5.139645e-03 ; 6.105928e-03 ; 1.352792e-02 ];
Tc_error_14  = [ 1.971628e+00 ; 2.262114e+00 ; 2.264001e+00 ];

%-- Image #15:
omc_15 = [ -2.293354e+00 ; -1.906182e+00 ; 3.875688e-01 ];
Tc_15  = [ -1.205102e+02 ; -7.830570e+01 ; 5.140715e+02 ];
omc_error_15 = [ 4.600755e-03 ; 3.323621e-03 ; 8.668220e-03 ];
Tc_error_15  = [ 1.938427e+00 ; 2.247197e+00 ; 2.106140e+00 ];

%-- Image #16:
omc_16 = [ 2.097953e+00 ; 2.197677e+00 ; -5.358074e-02 ];
Tc_16  = [ -9.117049e+01 ; -7.849214e+01 ; 3.302810e+02 ];
omc_error_16 = [ 3.273840e-03 ; 3.218798e-03 ; 7.250112e-03 ];
Tc_error_16  = [ 1.263866e+00 ; 1.459550e+00 ; 1.441083e+00 ];

%-- Image #17:
omc_17 = [ -1.947950e+00 ; -2.146872e+00 ; 1.867693e-02 ];
Tc_17  = [ -6.228539e+01 ; -6.910250e+01 ; 4.049058e+02 ];
omc_error_17 = [ 3.297371e-03 ; 3.799894e-03 ; 7.525316e-03 ];
Tc_error_17  = [ 1.535997e+00 ; 1.773765e+00 ; 1.723558e+00 ];

%-- Image #18:
omc_18 = [ 2.075128e+00 ; 2.353469e+00 ; 9.832111e-02 ];
Tc_18  = [ -7.005545e+01 ; -1.155687e+02 ; 4.576925e+02 ];
omc_error_18 = [ 4.733312e-03 ; 5.269066e-03 ; 1.150971e-02 ];
Tc_error_18  = [ 1.773878e+00 ; 2.019000e+00 ; 2.074978e+00 ];

%-- Image #19:
omc_19 = [ 1.521898e+00 ; 2.112088e+00 ; -6.727488e-01 ];
Tc_19  = [ -3.179551e+01 ; -3.485444e+01 ; 5.332104e+02 ];
omc_error_19 = [ 3.037127e-03 ; 3.851233e-03 ; 7.044278e-03 ];
Tc_error_19  = [ 2.005842e+00 ; 2.325571e+00 ; 1.839047e+00 ];

%-- Image #20:
omc_20 = [ 1.886589e+00 ; 1.916387e+00 ; -6.180890e-01 ];
Tc_20  = [ -6.374950e+01 ; -2.857637e+01 ; 4.366743e+02 ];
omc_error_20 = [ 3.244817e-03 ; 3.251685e-03 ; 6.669446e-03 ];
Tc_error_20  = [ 1.639608e+00 ; 1.897731e+00 ; 1.589440e+00 ];

