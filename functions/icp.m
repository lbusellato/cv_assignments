function G = icp(model, data)
    % ICP estimation of the rigid transformation that aligns the given
    % views. Based on the scripts by A.Fusiello
    G = eye(4);
    res = inf;
    prevres = 0;
    tol = 1e-8; % Minimum distance between points
    maxit = 200; % Maximum number of iterations
    % Switch to homogeneous coordinates
    data = [data ones(size(data, 1), 1)]';
    % ICP
    it = 0;
    while abs(res - prevres) > tol && it < maxit
        it = it + 1;
        prevres = res;
        % Apply the current transformation to the data
        alignedData = (G(1:3,:)*data)';
        % Compute the points in the aligned view closest to the model view
        modelcp = ones(size(alignedData));
        mindist = inf*ones(size(alignedData,1),1);
        for i = 1:size(alignedData,1)
            for j = 1:size(model,1)
                d = norm(model(j,:) - alignedData(i,:));
                if d < mindist(i)
                    mindist(i) = d;
                    modelcp(i,:) = model(j,:);
                end
            end
        end
        res = mean(mindist);
        % Remove NaN values from the closest points and their "correspondences"
        i = find(~isnan(modelcp));
        modelcp = reshape(modelcp(i),length(modelcp(i))/3,3);
        alignedData = reshape(alignedData(i),length(alignedData(i))/3,3);
        % Compute centroids
        cm = mean(alignedData);
        cd = mean(modelcp);
        % Center each set on the centroid of the other
        alignedData = alignedData - cm;
        modelcp = modelcp - cd;
        % Compute the rotation using SVD
        K = modelcp'*alignedData;
        [U,D,V] = svd(K);
        S = diag([1 1 det(U*V)']);
        R = U*S*V';
        % Compute the translation
        t = cd' - R*cm';
        % Compose this iteration's rigid transformation
        Gi = [ R t; 0 0 0 1];
        % Update the overall rigid transformation
        G = Gi * G;
    end
end