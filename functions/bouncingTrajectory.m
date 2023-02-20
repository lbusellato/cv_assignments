%--------------------------------------------------------------------------
%
%   bouncingTrajectory.m
%
%   This function generates the trajectory of a ball bouncing on a 
%   plane, given the initial coordinates x0, y0 and z0 and the initial
%   velocities in the three directions vx0, vy0 and vz0.
%
%   Author: Lorenzo Busellato, VR472249, 2023
%
%--------------------------------------------------------------------------
function animation = bouncingTrajectory(x0, y0, z0, vx0, vy0, vz0)
    % Sphere and floor parameters
    e = 0.75; % Coefficient of restitution (ratio between velocity after impact
              % and velocity before impact with the floor)
    g = 9.81; % Gravitational acceleration in m/s^2 (NB: gravity points
               % towards the negative z direction relative to the board)
    v = [vx0 vy0 vz0]; % Initial velocity
    % Simulation parameters
    animation.dt = 0.001;	% Time step
    zmax = z0;	% Initial drop height
    x = x0;		% Instantaneous x coordinate
    y = y0;		% Instantaneous y coordinate
    z = z0;		% Instantaneous z coordinate
    zstop = 0.001;	% Minimal bouncing height after which the simulation stops
    T = 0 : animation.dt : 1000; % Time array
    animation.X = zeros(1, length(T)); % X coordinate array
    animation.Y = zeros(1, length(T)); % Y coordinate array
    animation.Z = zeros(1, length(T)); % Z coordinate array
    max_it = 100000; % Failsafe to prevent infinite loops
    it = 1; % Current iteration 
    % Generating the ball trajectory
    while (zmax > zstop) && (it < max_it)
        x = x + v(1, 1) * animation.dt; % x(t+dt) = x(t) + v*dt
        y = y + v(1, 2) * animation.dt; % y(t+dt) = y(t) + v*dt
        z = z + v(1, 3) * animation.dt - 0.5 * g * animation.dt ^ 2; % z(t+dt) = z(t) + v*t - 0.5*g*t^2
        if z < 0
            % The ball hit the floor
            z = 0;
            % New velocity after the bounce
            v(1, 3) = -v(1, 3) * e; 
            % Next bounce height (conservation of energy)
            zmax = 0.5 * v(1, 3)^2 / g; 
        else
            % Update velocity
            v(1, 3) = v(1, 3) - g*animation.dt;
        end
        % Save the current coordinates
        animation.X(it) = x;
        animation.Y(it) = y;
        animation.Z(it) = z; 
        it = it + 1; % Step the simulation
    end
    % Crop the coordinate arrays to their filled part and convert to mm
    animation.X = 1000 * animation.X(1 : it - 1); 
    animation.Y = 1000 * animation.Y(1 : it - 1); 
    animation.Z = 1000 * animation.Z(1 : it - 1); 
end