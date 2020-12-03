%Loads all the result files from the workspace
function ret = importResults2(resultFolder)
    ret.time = load(strcat(resultFolder,'/time.ascii'));  
    
    ret.sigma_xx = load(strcat(resultFolder,'/Sigma_XX.ascii'));
    ret.sigma_yy = load(strcat(resultFolder,'/Sigma_YY.ascii'));
    ret.sigma_zz = load(strcat(resultFolder,'/Sigma_ZZ.ascii'));
	ret.sigma_xy = load(strcat(resultFolder,'/Sigma_XY.ascii'));
    ret.sigma_xz = load(strcat(resultFolder,'/Sigma_XZ.ascii'));
    ret.sigma_yz = load(strcat(resultFolder,'/Sigma_YZ.ascii'));
    ret.sigma_vm = load(strcat(resultFolder,'/SigmaVM.ascii'));
    ret.sigma_yield = load(strcat(resultFolder,'/Sigma_Yield.ascii'));
    
    ret.e_pl = load(strcat(resultFolder,'/EPL.ascii'));
    ret.e_xx = load(strcat(resultFolder,'/E_XX.ascii'));
    ret.e_yy = load(strcat(resultFolder,'/E_YY.ascii'));
    ret.e_zz = load(strcat(resultFolder,'/E_ZZ.ascii'));
% 	ret.e_xy = load(strcat(resultFolder,'/E_XY.ascii'));
% 	ret.e_xz = load(strcat(resultFolder,'/E_XZ.ascii'));
% 	ret.e_yz = load(strcat(resultFolder,'/E_YZ.ascii'));

    ret.a_xx = load(strcat(resultFolder,'/A_XX.ascii'));
    ret.a_yy = load(strcat(resultFolder,'/A_YY.ascii'));
    ret.a_zz = load(strcat(resultFolder,'/A_ZZ.ascii')); 
	ret.a_xy = load(strcat(resultFolder,'/A_XY.ascii')); 
	ret.a_xz = load(strcat(resultFolder,'/A_XZ.ascii'));
	ret.a_yz = load(strcat(resultFolder,'/A_YZ.ascii')); 
	
	ret.p = load(strcat(resultFolder,'/IF_P.ascii')); 
	ret.sigma_equi = sqrt(3/2 * ((ret.sigma_xx - ret.p).^2 + (ret.sigma_xx - ret.p).^2 + (ret.sigma_xx - ret.p).^2 + ret.sigma_xy.^2 + ret.sigma_xz.^2 + ret.sigma_yz.^2));
end
