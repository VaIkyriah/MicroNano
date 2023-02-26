function id = controller(maps,position,target)    
    % controller    Decides the id of the frequency that should be played.
    %               Usage:
    %
    %               id = controller(maps,position,target)
    %               
    %               maps is a struct array of length M and id should be
    %                  index to this array (1..M).
    %               position is the current position(s) of the particle(s)
    %               target is the current target(s) of the particle(s).
    %    
    %               The predicted movement of a particle after returning id
    %               is pnew = p + [maps(id).deltaX(p) maps(id).deltaY(p)].
    
    % TODO: Implement your controller here.
   p = position;
   dist1 = sqrt((target(1)-p(1))^2+(target(2)-p(2))^2);
   dist = repmat(sqrt(2.1),[1 length(maps)]);
   for i = 1:length(maps)
       pnew = p + [maps(i).deltaX(p) maps(i).deltaY(p)]+(sqrt(max(maps(i).variance(p),0)) * [1 1]) .* randn(size(p));
       A = sqrt((target(1)-pnew(1))^2+(target(2)-pnew(2))^2);
       dist(i) = A;
   end
   [value ids] = min(dist);
   if value < dist1
   id = ids;
   else
   id = randi(1,length(maps));
   end
end
        