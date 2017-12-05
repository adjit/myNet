function obj = TestRowIndecies()
%TestRows will contain an array of row indecies for EpsonPartsByMonth (the raw data from Excel)
%   There are several rows of data within the raw data, to make it
%   easier to keep track of which rows they are this function will hold
%   static row values
%
%   1- ERC-22B
%   2- ERC-32B
%   3- ERC-38BR
%   4- PS-180
%   5- TMU220B-653
%   6- TM-U295-272
%   7- UB-S01

    obj = [265, 271, 274, 419, 586, 609, 642];
    
end


