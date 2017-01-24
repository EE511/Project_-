%%--------------------------------------------------------------------------
%%Project-1:: Question - 1
%%To Simulate a fair coin toss 50 times.Count the number of Heads, record 
%%the longest run and generate a histogram for the Bernoulli outcomes

%%The below function performs the following
%%1) Rand function(Uniformly distributed random numbers) to generate a 
   %%random number between (0,1) as per user defined num_of_flips
%%2) find function to get the indices of above vector having '0'(Heads) and 
   %%dump it in an array
%%3) subtract adjacent elements to above array to check if the difference 
   %%is 1(consecutive heads)
%%4) Now that we have an array of consecutive heads distribution, plot 
   %%histogram for the distribution combined with number of trails
%%--------------------------------------------------------------------------
function [] = coin_toss()
  % Initialize 
  num_of_flips = 50;%As specified in the question
  total_trails = [1 20 100 200 1000];%To iterate all trails in single run
  distribution_of_heads = zeros(1, 'uint8');
  head_run_lengths = zeros(1, 50);
  
  for experiment = 1:5
      number_of_trails = total_trails(experiment);
      for trail=1:number_of_trails
          % generate a vector of num_of_flips Flips
          coin_flips = rand(num_of_flips, 1) > 0.5;
          % get the indices of heads(0) from the overall coin_flips array
          Indices_of_heads = find(coin_flips==0);
          [len_of_indices_vector,~] = size(Indices_of_heads);  
          consecutive_heads=1;
          [num_of_heads,~] = size(Indices_of_heads);
          distribution_of_heads(trail) = num_of_heads;
          %For loop to get the number of instances of consecutive heads
          for iter=1:(len_of_indices_vector-1)
              if (Indices_of_heads(iter+1) - Indices_of_heads(iter)) ~= 1
                  head_run_lengths(iter) = consecutive_heads;
                  consecutive_heads=1;
                  if iter == len_of_indices_vector
                      head_run_lengths(iter+1) = consecutive_heads;
                  end              
              else
                  consecutive_heads = consecutive_heads+1;
              end 
          end
          %removes the '0's in the array containing distribution of heads
          head_run_lengths = head_run_lengths(head_run_lengths~=0);
      end
      subplot(5,1,experiment);
      if experiment == 1 %Required to plot histogram of Bernoulli's Trail
          histogram(coin_flips);
          disp('Number of Heads with one set of 50 Flips is')
          disp(num_of_heads);
      else
          histogram(distribution_of_heads);%Plot Histogram of Heads distribution
      end
  end
  %Gets the longest instance of consecutive heads
  Max_heads_run_length = max(head_run_lengths);
  disp('Longest consecutive run of heads')  
  disp(Max_heads_run_length)