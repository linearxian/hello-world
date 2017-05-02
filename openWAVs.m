Mat = [];

for i = 1:24
    path = sprintf('C:\\daten\\Temp\\eUPs_messzelle\\Test\\T%d',i);
    folder = path;
    dirListing = dir(folder);
    M = zeros(length(dirListing)-3,3);
    index = 1;

    for d = 3:length(dirListing)
    % loop through the files and open.
        filename = fullfile(folder,dirListing(d).name);
        [y,Fs] = audioread(filename);
        [Frequency,SPL, ww] = FreqSPLOutput(y,Fs);
        M(index,1) = SPL;
        M(index,2) = Frequency;
        M(index,3) = ww;
        index = index + 1;
    end
    Mat = [Mat; M];
end

filename2 = 'Mat_test.mat';
save(filename2,'Mat')
