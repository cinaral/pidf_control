%********
%* setup
%********
addpath('..\..\matlab');

io_config;
test_name = 'test-pidf-PDF';
prefix = append(dat_dir, '/', test_name, '-');
exe_name = append(test_name, '.exe');
t_arr_fname = 't_arr.dat';
x_arr_fname = 'x_arr.dat';
x_arr_chk_fname = 'x_arr_chk.dat';
u_arr_fname = 'u_arr.dat';
u_arr_chk_fname = 'u_arr_chk.dat';

t_dim = 1e3;
x_dim = 3;
u_dim = 1;
error_thres = 1e-13;
%* __USE_SINGLE_PRECISION__
%error_thres = 1e-5;
f = 10;

%*******************
%* create test data 
%*******************
A = [0, 1, 0; 0, -3.038760, 496.1240; 0, -37.64706, -823.5294];
B = [0, 0, 588.2353];
C = [1, 0, 0];
D = 0;

% t_arr_chk = linspace(0, 1, t_dim).';
% motor_system = @(x, u) A*x + B*u;
% 
% x_arr_chk = zeros(t_dim, x_dim);
% u_arr = zeros(t_dim, u_dim);
% 
% for i = 1:t_dim 
% 	t = t_arr_chk(i, :).';
% 	x = x_arr_chk(i, :).';
% 	u = sin(t_arr_chk(i)*2*pi*f);
% 
% 	if i < t_dim
% 		h = t_arr_chk(i + 1) - t;	
% 		x_arr_chk(i + 1, :) = step_rk4(t, x, h, @(t, x) motor_system(x, u)).';
% 	end
% 	u_arr(i, :) = u.';
% end

%figure('Name', 'u');
%plot(t_arr, u_arr)
%figure('Name', 'x_arr_chk');
%plot(t_arr, x_arr_chk(:, 1))

%************************************
%* write input (for test executable)
%************************************
% writematrix(u_arr, append(prefix, u_arr_fname), 'Delimiter', delimiter);  
% writematrix(x_arr_chk, append(prefix, x_arr_chk_fname), 'Delimiter', delimiter);  

%***************************
%* call the test executable
%***************************
prev_pwd = pwd;
cd(bin_dir);

if ~isfile(exe_name)
	error(append(bin_dir, '/', exe_name, ' does not exist. Use CMake to build the test.'));
end

if system(exe_name) > 0
	warning(append(bin_dir, '/', exe_name, ' has returned failure.'));
end

cd(prev_pwd);

%******************************************
%* read output (created by the executable)
%******************************************
t_arr = readmatrix(append(prefix, t_arr_fname));
x_arr = readmatrix(append(prefix, x_arr_fname));
u_arr = readmatrix(append(prefix, u_arr_fname));

%*********
%* verify
%*********
% max_error = max(vecnorm(x_arr - x_arr_chk, 2, 2));
% mean_error = mean(vecnorm(x_arr - x_arr_chk, 2, 2));
% 
% if max_error < error_thres
%     disp(append(test_name, '	ok'));
% else
%     disp(append(test_name, '	fail'));
% end

figure('Name', 'x');
hold on;
plot(t_arr, x_arr(:, 1));
% plot(t_arr_chk, x_arr_chk(:, 1), '--');