function [points] = LSystemTree3D(d)
    %% Parameter Retreival
    iterations = d.iterations;
    axiom = d.axiom;
    rules = d.rules;
    angle = d.angle;
    initialLength = d.initialLength;
    reductionFactor = d.reductionFactor;
    spatialAngle = d.spatialAngle;
    
    %% Lindenmayer String Computation
    currentString = axiom;
    for i = 1:iterations
        nextString = '';
        for j = 1:length(currentString)
            currentChar = currentString(j);
            ruleApplied = false;
            
            % Check if a rule can be applied
            for k = 1:size(rules, 1)
                if strcmp(currentChar, rules{k, 1})
                    nextString = [nextString, rules{k, 2}];
                    ruleApplied = true;
                    break;
                end
            end
            
            % If no rule applied, keep the character unchanged
            if ~ruleApplied
                nextString = [nextString, currentChar];
            end
        end
        currentString = nextString;
    end
    
    %% Plotting the LSystem Result
    position = [0, 0, 0];
    orientation = [0, 0, 0]; % [pitch, yaw, roll]
    points = zeros(iterations + 1, 3);
    points(1, :) = position;
    currentIdx = 2;
    
    % Stack to manage branching positions and orientations
    positionStack = [];
    orientationStack = [];
    
    % Traverse the final string and store the points for vectorized plotting
    for i = 1:length(currentString)
        currentChar = currentString(i);
        
        switch currentChar
            case 'F'
                % Move forward and store the point
                newPosition = position + initialLength * [
                    cosd(orientation(2)) * cosd(orientation(1)), ...
                    sind(orientation(2)) * cosd(orientation(1)), ...
                    sind(orientation(1))
                ];
                points(currentIdx, :) = newPosition;
                currentIdx = currentIdx + 1;
                position = newPosition;
            case '+'
                % Turn left (yaw)
                orientation(2) = orientation(2) + angle;
            case '-'
                % Turn right (yaw)
                orientation(2) = orientation(2) - angle;
            case '&'
                % Pitch down
                orientation(1) = orientation(1) - spatialAngle;
            case '^'
                % Pitch up
                orientation(1) = orientation(1) + spatialAngle;
            case '\'
                % Roll left
                orientation(3) = orientation(3) - spatialAngle;
            case '/'
                % Roll right
                orientation(3) = orientation(3) + spatialAngle;
            case '['
                % Push the current position and orientation to the stack
                positionStack = [positionStack; position];
                orientationStack = [orientationStack; orientation];
            case ']'
                % Pop the position and orientation from the stack
                position = positionStack(end, :);
                positionStack = positionStack(1:end-1, :);
                orientation = orientationStack(end, :);
                orientationStack = orientationStack(1:end-1, :);
            otherwise
                % Ignore other characters
        end
        
        % Reduce the length for the next iteration
        initialLength = initialLength * reductionFactor;
    end
    
    %darkBackground = rand(1, 3) * 0.2;
    %set(gcf, 'Color', darkBackground);
    %brightColor = rand(1, 3) * 0.6 + 0.4;
    %plot3(points(:, 1), points(:, 2), points(:, 3), 'Color', brightColor, 'LineWidth', 1.5);
    %axis equal;
    %axis off;
    %view(3); % Set the 3D view
    %rotate3d on
end
