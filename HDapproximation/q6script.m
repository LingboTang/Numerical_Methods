% part6 script
load data1.mat;

featurefun = @(X)quadfeatures(X);
kernelfun1 = @(X1,X2)quadkernel(X1,X2);
kernelfun2 = @(X1,X2)gausskernel(X1,X2,2600);

   w1 = fitlin(X,y);
   w2 = fitlinreg(X,y,50);
   w3 = fitgenreg(X,y,1e7,featurefun);

   a4 = fitdualgenreg(X,y,1e7,kernelfun1);
   a5 = fitdualgenreg(X,y,8e-4,kernelfun2);

   yhat_train1 = X*w1;
   yhat_train2 = X*w2;
   yhat_train3 = predictgen(featurefun,w3,X);
   yhat_train4 = predictdualgen(X,X,kernelfun1,a4);
   yhat_train5 = predictdualgen(X,X,kernelfun2,a5);
   
   err_train1 = (y - yhat_train1).^2;
   err_train2 = (y - yhat_train2).^2;
   err_train3 = (y - yhat_train3).^2;
   err_train4 = (y - yhat_train4).^2;
   err_train5 = (y - yhat_train5).^2;
   
   yhat_test1 = Xtest*w1;
   yhat_test2 = Xtest*w2;
   yhat_test3 = predictgen(Xtest,featurefun,w3);
   yhat_test4 = predictdualgen(X,X,kernelfun1,a4);
   yhat_test5 = predictdualgen(X,X,kernelfun2,a5);
   
   err_test1 = (ytest - yhat_test1).^2;
   err_test2 = (ytest - yhat_test2).^2;
   err_test3 = (ytest - yhat_test3).^2;
   err_test4 = (ytest - yhat_test4).^2;
   err_test5 = (ytest - yhat_test5).^2;
    
average_train_error1 = mean(err_train1);
average_train_error2 = mean(err_train2);
average_train_error3 = mean(err_train3);
average_train_error4 = mean(err_train4);
average_train_error5 = mean(err_train5);

average_test_error1 = mean(err_test1);
average_test_error2 = mean(err_test2);
average_test_error3 = mean(err_test3);
average_test_error4 = mean(err_test4);
average_test_error5 = mean(err_test5);
