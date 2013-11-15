function res = findCamber(solution)
    Xdiff = solution.KnuckleUpper(1) - solution.KnuckleLower(1); %difference in x positions of two points
    Ydiff = solution.KnuckleUpper(2) - solution.KnuckleLower(2); %difference in y positions of two points
    res = atand(Xdiff/Ydiff); %returns angle in degrees
end