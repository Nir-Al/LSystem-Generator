function saveStructWithChosenName(p, chosenName)
    % Check if the input is a struct
    if ~isstruct(p)
        error('Input must be a struct.');
    end

    % Check if the chosen name is a valid string
    if ~ischar(chosenName) || isempty(chosenName)
        error('Chosen name must be a non-empty string.');
    end

    % Add a ".mat" extension to the chosen name if not already present
    [~, ~, ext] = fileparts(chosenName);
    if ~strcmp(ext, '.mat')
        chosenName = [chosenName, '.mat'];
    end

    % Check if the file already exists
    if isfile(chosenName)
        choice = questdlg('The file already exists. Do you want to overwrite it?', ...
                          'File Exists', 'Yes', 'No', 'No');
        if strcmp(choice, 'No')
            disp('Operation cancelled.');
            return;
        end
    end

    % Save the struct to the specified file
    try
        save(chosenName, 'p');
        disp(['Struct successfully saved as ', chosenName]);
    catch
        error('Error saving the struct.');
    end
end
