function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

predict = sigmoid(X*theta);
errors = -y' * log(predict) - (1 - y)' * log(1 - predict);
size_of_theta = size(theta, 1);
theta_ = theta(2:size_of_theta, :);
J = 1/m * sum(errors) + lambda / (2 * m) * theta_' * theta_;
grad_ = 1/m * X' * (predict - y);
grad = 1/m * X' * (predict - y) + lambda / m * theta ;
grad(1) = grad_(1);


% =============================================================

end
