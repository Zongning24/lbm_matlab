function f = scatter(f, G, weights, ci, dh)
% distributes particles to f according to G.
% G is a number of particles, not a distribution (which is number of 
%   particles normalized by volume).

cell_area = dh^2;

bi = bounceback_components(ci);
for s = 1:size(weights,1)
  for k = 1:length(bi)
    surfel = weights{s,k};
    touched_cells = size(surfel,1);
    for t = 1:touched_cells
        i = round(surfel(t,1));
        j = round(surfel(t,2));
        w = surfel(t,3);
        f(j,i,bi(k)) = f(j,i,bi(k)) + w*G(s,k) / cell_area;
    end
  end
end