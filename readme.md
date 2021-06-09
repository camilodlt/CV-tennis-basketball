# Computer Vision on tennis and basketball balls

This follow the 2nd chapter of Deep learning for coders book.
We used transfer learning to rapidly train a model that classify tennis and basketball balls.
Results were pretty good without much tuning.
Accuracy 93% on 20% validation set.
What is very interesting is that the model (resnet18) adapted rapidly and with an small training set to the data.

## Where did the data came from?

I downloaded photos from the Bing images API.
I removed the photos that did not correspond to the task (basketball shoes for ex.)

## I tries some of my own photos and the results where perfect.

![image](https://user-images.githubusercontent.com/64303300/121358902-426eba00-c933-11eb-955b-b5f9d65a9344.png)

## An small shiny app is also available for interactive inference 
Shiny app is done in R and the interface with python is done with reticulate. 
![image](https://user-images.githubusercontent.com/64303300/121369376-173c9880-c93c-11eb-96a7-14a354ab5f70.png)
