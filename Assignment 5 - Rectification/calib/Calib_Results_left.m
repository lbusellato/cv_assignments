% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 995.291736153373563 ; 990.535488203535692 ];

%-- Principal point:
cc = [ 442.802850152621716 ; 654.429091872056915 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.160453378518455 ; -0.478569395213968 ; 0.005539435773574 ; -0.003021243581154 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 3.901994613409190 ; 3.778502374721340 ];

%-- Principal point uncertainty:
cc_error = [ 4.303958847720981 ; 4.125818553127931 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.012269634170978 ; 0.033323167266003 ; 0.001506543867646 ; 0.002134714807838 ; 0.000000000000000 ];

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
omc_1 = [ 1.780396e+00 ; 1.855843e+00 ; -8.243729e-01 ];
Tc_1  = [ 5.248034e+01 ; -1.003163e+02 ; 7.548978e+02 ];
omc_error_1 = [ 3.117443e-03 ; 3.928482e-03 ; 5.806449e-03 ];
Tc_error_1  = [ 3.274425e+00 ; 3.112499e+00 ; 2.619981e+00 ];

%-- Image #2:
omc_2 = [ 1.991019e+00 ; 2.155114e+00 ; -4.923856e-01 ];
Tc_2  = [ 6.014447e+01 ; -1.582086e+02 ; 6.812300e+02 ];
omc_error_2 = [ 3.355634e-03 ; 3.951928e-03 ; 7.079277e-03 ];
Tc_error_2  = [ 2.976304e+00 ; 2.800256e+00 ; 2.613614e+00 ];

%-- Image #3:
omc_3 = [ -2.109933e+00 ; -2.264539e+00 ; 1.597668e-02 ];
Tc_3  = [ 5.342562e+01 ; -1.776747e+02 ; 5.819210e+02 ];
omc_error_3 = [ 4.139775e-03 ; 4.848363e-03 ; 8.959319e-03 ];
Tc_error_3  = [ 2.557574e+00 ; 2.424605e+00 ; 2.510187e+00 ];

%-- Image #4:
omc_4 = [ -1.682917e+00 ; -2.486504e+00 ; 3.980628e-01 ];
Tc_4  = [ 1.461190e+02 ; -2.027353e+02 ; 6.333794e+02 ];
omc_error_4 = [ 4.209908e-03 ; 5.116619e-03 ; 8.859244e-03 ];
Tc_error_4  = [ 2.807620e+00 ; 2.666360e+00 ; 2.679094e+00 ];

%-- Image #5:
omc_5 = [ 1.526744e+00 ; 2.497662e+00 ; -8.009571e-01 ];
Tc_5  = [ 1.345268e+02 ; -1.873090e+02 ; 6.745729e+02 ];
omc_error_5 = [ 2.511456e-03 ; 4.617901e-03 ; 6.703330e-03 ];
Tc_error_5  = [ 2.963830e+00 ; 2.814012e+00 ; 2.585941e+00 ];

%-- Image #6:
omc_6 = [ 2.294385e+00 ; 1.908207e+00 ; -7.595646e-01 ];
Tc_6  = [ 4.428604e+00 ; -1.511627e+02 ; 6.911853e+02 ];
omc_error_6 = [ 3.316514e-03 ; 3.886040e-03 ; 7.507133e-03 ];
Tc_error_6  = [ 3.026953e+00 ; 2.840862e+00 ; 2.503223e+00 ];

%-- Image #7:
omc_7 = [ 2.207626e+00 ; 2.024475e+00 ; 1.764210e-01 ];
Tc_7  = [ -3.049299e+01 ; -1.815002e+02 ; 5.992458e+02 ];
omc_error_7 = [ 4.087383e-03 ; 3.565224e-03 ; 7.345753e-03 ];
Tc_error_7  = [ 2.644389e+00 ; 2.488737e+00 ; 2.642919e+00 ];

%-- Image #8:
omc_8 = [ 1.995874e+00 ; 1.758210e+00 ; 5.817734e-01 ];
Tc_8  = [ -6.295420e+00 ; -1.614166e+02 ; 5.478478e+02 ];
omc_error_8 = [ 4.059099e-03 ; 2.886752e-03 ; 5.596269e-03 ];
Tc_error_8  = [ 2.419581e+00 ; 2.274458e+00 ; 2.454119e+00 ];

%-- Image #9:
omc_9 = [ 2.313919e+00 ; 1.592865e+00 ; 1.353649e-01 ];
Tc_9  = [ 5.203619e+00 ; -1.107031e+02 ; 5.673272e+02 ];
omc_error_9 = [ 4.195441e-03 ; 2.561477e-03 ; 6.203599e-03 ];
Tc_error_9  = [ 2.476318e+00 ; 2.334146e+00 ; 2.369612e+00 ];

%-- Image #10:
omc_10 = [ 2.310481e+00 ; 1.491824e+00 ; -2.206356e-01 ];
Tc_10  = [ -1.795033e+01 ; -8.686058e+01 ; 6.295274e+02 ];
omc_error_10 = [ 3.942929e-03 ; 2.776288e-03 ; 6.227941e-03 ];
Tc_error_10  = [ 2.734209e+00 ; 2.580972e+00 ; 2.474926e+00 ];

%-- Image #11:
omc_11 = [ 2.165037e+00 ; 1.662988e+00 ; -5.094218e-01 ];
Tc_11  = [ 1.084547e+01 ; -1.016980e+02 ; 6.802165e+02 ];
omc_error_11 = [ 3.624932e-03 ; 3.282090e-03 ; 6.303206e-03 ];
Tc_error_11  = [ 2.955590e+00 ; 2.789554e+00 ; 2.514323e+00 ];

%-- Image #12:
omc_12 = [ 1.978046e+00 ; 1.920179e+00 ; -8.685865e-01 ];
Tc_12  = [ 6.986301e+01 ; -1.361592e+02 ; 7.262677e+02 ];
omc_error_12 = [ 3.210979e-03 ; 3.952629e-03 ; 6.422505e-03 ];
Tc_error_12  = [ 3.166409e+00 ; 2.993710e+00 ; 2.551185e+00 ];

%-- Image #13:
omc_13 = [ -2.264069e+00 ; -1.759329e+00 ; 1.294640e+00 ];
Tc_13  = [ 7.547435e+01 ; -9.071303e+01 ; 7.534416e+02 ];
omc_error_13 = [ 5.174804e-03 ; 2.284011e-03 ; 6.826256e-03 ];
Tc_error_13  = [ 3.268345e+00 ; 3.121256e+00 ; 2.451661e+00 ];

%-- Image #14:
omc_14 = [ -2.465770e+00 ; -1.269715e+00 ; 1.074053e+00 ];
Tc_14  = [ 3.995447e+01 ; -9.984908e+01 ; 7.211308e+02 ];
omc_error_14 = [ 5.075540e-03 ; 1.950576e-03 ; 7.071868e-03 ];
Tc_error_14  = [ 3.141860e+00 ; 2.979164e+00 ; 2.357567e+00 ];

%-- Image #15:
omc_15 = [ -2.689507e+00 ; -7.776388e-01 ; 1.129211e+00 ];
Tc_15  = [ 4.374310e+01 ; -5.695761e+01 ; 7.126121e+02 ];
omc_error_15 = [ 5.115838e-03 ; 1.680053e-03 ; 7.150388e-03 ];
Tc_error_15  = [ 3.087864e+00 ; 2.942024e+00 ; 2.248647e+00 ];

%-- Image #16:
omc_16 = [ 2.246817e+00 ; 1.584008e+00 ; -9.325787e-01 ];
Tc_16  = [ 2.007536e+01 ; -5.626973e+01 ; 6.807942e+02 ];
omc_error_16 = [ 3.519768e-03 ; 3.516137e-03 ; 6.582556e-03 ];
Tc_error_16  = [ 2.947137e+00 ; 2.804686e+00 ; 2.244227e+00 ];

%-- Image #17:
omc_17 = [ 2.109895e+00 ; 1.939109e+00 ; 3.888269e-02 ];
Tc_17  = [ -1.198402e+01 ; -1.135869e+02 ; 5.960401e+02 ];
omc_error_17 = [ 3.821929e-03 ; 3.084760e-03 ; 6.333827e-03 ];
Tc_error_17  = [ 2.589153e+00 ; 2.457382e+00 ; 2.476376e+00 ];

%-- Image #18:
omc_18 = [ 2.535833e+00 ; 1.362817e+00 ; 7.309264e-02 ];
Tc_18  = [ -1.329697e+01 ; -6.524826e+01 ; 5.556126e+02 ];
omc_error_18 = [ 4.351713e-03 ; 2.079207e-03 ; 6.635972e-03 ];
Tc_error_18  = [ 2.413611e+00 ; 2.285694e+00 ; 2.301964e+00 ];

%-- Image #19:
omc_19 = [ -1.918971e+00 ; -1.856792e+00 ; -4.048331e-01 ];
Tc_19  = [ 2.993527e+01 ; -1.538020e+02 ; 5.316749e+02 ];
omc_error_19 = [ 3.247820e-03 ; 4.170375e-03 ; 7.029564e-03 ];
Tc_error_19  = [ 2.355700e+00 ; 2.184042e+00 ; 2.274738e+00 ];

%-- Image #20:
omc_20 = [ -1.623490e+00 ; -1.846074e+00 ; -1.117657e-01 ];
Tc_20  = [ 6.657550e+01 ; -1.761305e+02 ; 5.613548e+02 ];
omc_error_20 = [ 3.095344e-03 ; 3.932620e-03 ; 6.671343e-03 ];
Tc_error_20  = [ 2.494019e+00 ; 2.327635e+00 ; 2.426738e+00 ];

