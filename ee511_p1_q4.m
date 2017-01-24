%%--------------------------------------------------------------------------
%%Project-1:: Question - 4
%%To Simulate a fair coin toss and count the number of tosses until 
%%reaching a user specified positive number of heads

%%The below function runs a while loop until the number of heads observed 
%%is equal to the user defined number. 
%%Inside the while loop, we have
%%1) Rand function(Uniformly distributed random numbers) to generate a 
   %%random number between (0,1)
%%2) NumFlips and head_count to keep track of the number of coin fips and 
   %%heads.
%%3) If a Tail(1) occurs, reset the head_count. Otherwise run while loop 
   %%until the head_count Not Equal to user_num_heads
%%4) A Summary showing total number of flips for user defined consecutive heads
%%--------------------------------------------------------------------------
function [ ] = coin_toss(user_num_heads)
  %initialize
  head_count = 0;
  NumFlips = 0;
  array_of_total_flips = zeros(1, 'uint8');
  
  while user_num_heads ~= head_count
      % generate a number U[0,1] and threshold to fair Bernoulli trial
      IsHead = (rand > 0.5); 
      NumFlips = NumFlips +1;%Incrementing the Number of Flips
      %contains the result of every flip until user defined positive number of heads
      array_of_total_flips(NumFlips) = IsHead;
      %Reset counter if coin flip results in tails
      if IsHead == 1
          head_count = 0;
      else
          head_count = head_count+1;
      end
  end
  disp('Result of all coin toss until reaching the user defined number of heads');
  disp(array_of_total_flips);  
  Summary=['Total flips to reach user defined heads(',num2str(head_count),') in a row'];
  disp(Summary);
  disp(NumFlips);