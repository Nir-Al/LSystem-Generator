function [points] = LSystemTree(p)
    %% Parameter Retreival
    iterations = p.iterations;
    axiom = p.axiom;
    rules = p.rules;
    angle = p.angle;
    initialLength = p.initialLength;
    reductionFactor = p.reductionFactor;
    
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
    position = [0, 0];
    orientation = 90;
    points = zeros(iterations + 1, 2);
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
                position = position + initialLength * [cosd(orientation), sind(orientation)];
                points(currentIdx, :) = position;
                currentIdx = currentIdx + 1;
            case '+'
                % Turn left
                orientation = orientation + angle;
            case '-'
                % Turn right
                orientation = orientation - angle;
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
    %plot(axes, points(:, 1), points(:, 2), 'Color', brightColor, 'LineWidth', 1.5);
    %axis equal;
    %axis off;
    
end