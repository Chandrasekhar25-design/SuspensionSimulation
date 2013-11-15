function suspensionSimulation(steeringRange, verticalRange, varargin)

    if length(varargin) > 1
        varName = varargin{1};
        varRange = varargin{2};
    else
        varName = [];
        varRange = [1];
    end
    
    camber = zeros(length(steeringRange),length(verticalRange),length(varRange));
    rollAxis = zeros(length(steeringRange),length(verticalRange), length(varRange));
    steeringAngle = zeros(length(steeringRange),length(verticalRange),length(varRange));
    
    for p = 1:length(steeringRange)
        for i = 1:length(verticalRange)
            for n = 1:length(varRange)
                if length(varargin)>1
                    solution = solve3D(steeringRange(i),verticalRange(n),...
                    [varName, '=', num2str(varRange(p))]);
                else
                    solution = solve3D(steeringRange(i),verticalRange(n));
                end
                
                camber(p,i,n) = findCamber(solution);
    
%                 rollAxis(p,i,n) = findRoll(solution);
    
                steeringAngle(p,i,n) = findSteering(solution);
                

                
            end
        end
    end
    
    genPlot(steeringAngle(:,:,1), steeringRange, verticalRange)

end