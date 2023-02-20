% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 990.654087818059338 ; 986.802716714853659 ];

%-- Principal point:
cc = [ 473.675620257425862 ; 644.702816537976787 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.144387441291286 ; -0.367796018703907 ; 0.003166325106500 ; -0.004314600932794 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 3.789663950072832 ; 3.675137779995680 ];

%-- Principal point uncertainty:
cc_error = [ 3.951024605501450 ; 4.511607487678805 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.010882472622294 ; 0.032393625611200 ; 0.001683670236541 ; 0.001922878696279 ; 0.000000000000000 ];

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
omc_1 = [ 1.793704e+00 ; 1.776902e+00 ; -7.858220e-01 ];
Tc_1  = [ -1.891741e+02 ; -8.985270e+01 ; 7.547801e+02 ];
omc_error_1 = [ 2.722144e-03 ; 4.166088e-03 ; 5.687254e-03 ];
Tc_error_1  = [ 3.019595e+00 ; 3.461961e+00 ; 2.752340e+00 ];

%-- Image #2:
omc_2 = [ 1.993110e+00 ; 2.077401e+00 ; -4.457001e-01 ];
Tc_2  = [ -1.787386e+02 ; -1.498366e+02 ; 6.834664e+02 ];
omc_error_2 = [ 2.425507e-03 ; 4.004605e-03 ; 6.764414e-03 ];
Tc_error_2  = [ 2.748194e+00 ; 3.125614e+00 ; 2.712638e+00 ];

%-- Image #3:
omc_3 = [ 2.147929e+00 ; 2.246183e+00 ; 1.893699e-03 ];
Tc_3  = [ -1.814378e+02 ; -1.712516e+02 ; 5.862858e+02 ];
omc_error_3 = [ 3.088648e-03 ; 4.388332e-03 ; 8.690731e-03 ];
Tc_error_3  = [ 2.371687e+00 ; 2.716650e+00 ; 2.540967e+00 ];

%-- Image #4:
omc_4 = [ -1.766853e+00 ; -2.517388e+00 ; 3.567071e-01 ];
Tc_4  = [ -9.164844e+01 ; -1.978510e+02 ; 6.415585e+02 ];
omc_error_4 = [ 3.485823e-03 ; 3.102631e-03 ; 7.425225e-03 ];
Tc_error_4  = [ 2.590825e+00 ; 2.912371e+00 ; 2.641213e+00 ];

%-- Image #5:
omc_5 = [ 1.551454e+00 ; 2.422888e+00 ; -7.646971e-01 ];
Tc_5  = [ -1.050165e+02 ; -1.815021e+02 ; 6.834312e+02 ];
omc_error_5 = [ 1.588724e-03 ; 4.540796e-03 ; 6.588056e-03 ];
Tc_error_5  = [ 2.760575e+00 ; 3.100635e+00 ; 2.612105e+00 ];

%-- Image #6:
omc_6 = [ 2.296512e+00 ; 1.835653e+00 ; -7.111035e-01 ];
Tc_6  = [ -2.359327e+02 ; -1.406573e+02 ; 6.929135e+02 ];
omc_error_6 = [ 2.411787e-03 ; 4.380544e-03 ; 6.824271e-03 ];
Tc_error_6  = [ 2.797838e+00 ; 3.225623e+00 ; 2.780970e+00 ];

%-- Image #7:
omc_7 = [ 2.175949e+00 ; 1.950600e+00 ; 1.972273e-01 ];
Tc_7  = [ -2.650259e+02 ; -1.725405e+02 ; 5.975601e+02 ];
omc_error_7 = [ 3.809871e-03 ; 4.666552e-03 ; 9.820524e-03 ];
Tc_error_7  = [ 2.452963e+00 ; 2.833796e+00 ; 2.877028e+00 ];

%-- Image #8:
omc_8 = [ 1.959535e+00 ; 1.693672e+00 ; 5.958331e-01 ];
Tc_8  = [ -2.374426e+02 ; -1.538137e+02 ; 5.482184e+02 ];
omc_error_8 = [ 3.815375e-03 ; 3.236451e-03 ; 6.440732e-03 ];
Tc_error_8  = [ 2.267027e+00 ; 2.601859e+00 ; 2.696448e+00 ];

%-- Image #9:
omc_9 = [ 2.284087e+00 ; 1.532929e+00 ; 1.688750e-01 ];
Tc_9  = [ -2.271465e+02 ; -1.055285e+02 ; 5.668334e+02 ];
omc_error_9 = [ 3.960484e-03 ; 3.054856e-03 ; 6.783210e-03 ];
Tc_error_9  = [ 2.285884e+00 ; 2.647617e+00 ; 2.488107e+00 ];

%-- Image #10:
omc_10 = [ 2.289096e+00 ; 1.422434e+00 ; -1.752650e-01 ];
Tc_10  = [ -2.522824e+02 ; -7.837311e+01 ; 6.243538e+02 ];
omc_error_10 = [ 3.538528e-03 ; 3.150396e-03 ; 6.200652e-03 ];
Tc_error_10  = [ 2.501871e+00 ; 2.915163e+00 ; 2.628110e+00 ];

%-- Image #11:
omc_11 = [ 2.154640e+00 ; 1.592257e+00 ; -4.564143e-01 ];
Tc_11  = [ -2.275977e+02 ; -9.375394e+01 ; 6.770109e+02 ];
omc_error_11 = [ 3.085073e-03 ; 3.590672e-03 ; 6.047427e-03 ];
Tc_error_11  = [ 2.711770e+00 ; 3.127798e+00 ; 2.685183e+00 ];

%-- Image #12:
omc_12 = [ 1.995963e+00 ; 1.846028e+00 ; -8.179777e-01 ];
Tc_12  = [ -1.717187e+02 ; -1.271229e+02 ; 7.293873e+02 ];
omc_error_12 = [ 2.563781e-03 ; 4.245170e-03 ; 6.088618e-03 ];
Tc_error_12  = [ 2.929058e+00 ; 3.332037e+00 ; 2.722373e+00 ];

%-- Image #13:
omc_13 = [ 2.292100e+00 ; 1.687599e+00 ; -1.221197e+00 ];
Tc_13  = [ -1.658214e+02 ; -8.103783e+01 ; 7.540763e+02 ];
omc_error_13 = [ 2.547408e-03 ; 4.924511e-03 ; 6.241667e-03 ];
Tc_error_13  = [ 3.007795e+00 ; 3.456371e+00 ; 2.690838e+00 ];

%-- Image #14:
omc_14 = [ -2.547183e+00 ; -1.244110e+00 ; 1.009521e+00 ];
Tc_14  = [ -1.994795e+02 ; -8.959594e+01 ; 7.182808e+02 ];
omc_error_14 = [ 4.688181e-03 ; 1.963345e-03 ; 6.449928e-03 ];
Tc_error_14  = [ 2.872589e+00 ; 3.319259e+00 ; 2.619324e+00 ];

%-- Image #15:
omc_15 = [ -2.759866e+00 ; -7.433549e-01 ; 1.043606e+00 ];
Tc_15  = [ -1.944054e+02 ; -4.835756e+01 ; 7.089682e+02 ];
omc_error_15 = [ 4.667347e-03 ; 2.227733e-03 ; 6.385489e-03 ];
Tc_error_15  = [ 2.822495e+00 ; 3.279547e+00 ; 2.503591e+00 ];

%-- Image #16:
omc_16 = [ 2.260825e+00 ; 1.512387e+00 ; -8.661054e-01 ];
Tc_16  = [ -2.163674e+02 ; -4.734089e+01 ; 6.757087e+02 ];
omc_error_16 = [ 2.843959e-03 ; 4.105896e-03 ; 5.926579e-03 ];
Tc_error_16  = [ 2.687970e+00 ; 3.129862e+00 ; 2.541986e+00 ];

%-- Image #17:
omc_17 = [ 2.090064e+00 ; 1.865590e+00 ; 6.896245e-02 ];
Tc_17  = [ -2.446371e+02 ; -1.054571e+02 ; 5.943767e+02 ];
omc_error_17 = [ 3.636190e-03 ; 3.894141e-03 ; 7.473881e-03 ];
Tc_error_17  = [ 2.394484e+00 ; 2.791913e+00 ; 2.598045e+00 ];

%-- Image #18:
omc_18 = [ 2.508474e+00 ; 1.306058e+00 ; 1.105799e-01 ];
Tc_18  = [ -2.426216e+02 ; -5.953939e+01 ; 5.534131e+02 ];
omc_error_18 = [ 4.155820e-03 ; 2.736194e-03 ; 6.941629e-03 ];
Tc_error_18  = [ 2.227090e+00 ; 2.600174e+00 ; 2.411490e+00 ];

%-- Image #19:
omc_19 = [ -1.968292e+00 ; -1.882463e+00 ; -4.419766e-01 ];
Tc_19  = [ -1.998737e+02 ; -1.481285e+02 ; 5.363493e+02 ];
omc_error_19 = [ 3.940160e-03 ; 3.389772e-03 ; 6.905607e-03 ];
Tc_error_19  = [ 2.179600e+00 ; 2.492451e+00 ; 2.477509e+00 ];

%-- Image #20:
omc_20 = [ -1.675539e+00 ; -1.873995e+00 ; -1.498388e-01 ];
Tc_20  = [ -1.665554e+02 ; -1.710075e+02 ; 5.659298e+02 ];
omc_error_20 = [ 3.643159e-03 ; 3.173000e-03 ; 6.084976e-03 ];
Tc_error_20  = [ 2.289667e+00 ; 2.611983e+00 ; 2.498467e+00 ];

