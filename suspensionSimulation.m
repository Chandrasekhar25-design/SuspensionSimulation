function outputs = suspensionSimulation(steeringRange, verticalRange, varargin)
%Expects varargin to be a column vector where each element contains an
%upper and lower A-arm length

    %% Initialize variables and parse input arguments
    %Initialize output structure
    finish = struct();

    %Parse variable input arguments
    if length(varargin) == 1
        geometries = varargin{1};
        finish.outputs.dimensions = {'Steering', 'Compression', 'Geometries'};
        finish.inputs.steeringRange = steeringRange;
        finish.inputs.verticalRange = verticalRange;
        finish.inputs.geometries = geometries;
    else
        geometries = [0];
        finish.outputs.dimensions = {'Steering', 'Compression'};
        finish.inputs.steeringRange = steeringRange;
        finish.inputs.verticalRange = verticalRange;
    end

    %Initialize data matrices
    camber = zeros(length(steeringRange),length(verticalRange),length(geometries));
    rollAxis = zeros(length(steeringRange),length(verticalRange), length(geometries));
    steeringAngle = zeros(length(steeringRange),length(verticalRange),length(geometries));
    
    %% Use solve3D to generate data and then compute outputs
    %For loops that iterate through the input parameters
    for p = 1:length(steeringRange)
        for i = 1:length(verticalRange)
            for n = 1:length(geometries)
                
                %If loops to determine whether or not to include additional
                %inputs
                if length(varargin) > 1
                    solution = solve3D(steeringRange(p),verticalRange(i),geometries(n,:));
                else
                    solution = solve3D(steeringRange(p),verticalRange(i));
                end
                
                %Compute outputs
                camber(p,i,n) = findCamber(solution);
%                 rollAxis(p,i,n) = findRoll(solution);
                steeringAngle(p,i,n) = findSteering(solution);
                
            end
        end
    end
    
    %% Output everything
    finish.outputs.camber = camber;
    finish.outputs.steeringAngle = steeringAngle;
%     finish.outputs.rollAxis = rollAxis;

    outputs = finish;

end