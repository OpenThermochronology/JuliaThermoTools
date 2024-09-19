## ---
cd(@__DIR__)

using Statistics, Distributions

# Define the number of iterations
n_iter = 1000

# Define the range for the variables
Ts = Uniform(0.0, 15.0)    # Surface Temperature (°C)
Tg = Uniform(25.0, 45.0)   # Geothermal Gradient (°C/km)
Tb = Uniform(110.0, 200.0) # Burial Temperature (°C)

# Initialize an array to store erosion depth results
erosion_depths = zeros(n_iter)

# Loop to calculate erosion depth 2000 times
for i in 1:n_iter
    # Sample random values from uniform distributions
    Tsᵢ = rand(Ts)
    Tgᵢ = rand(Tg)
    Tbᵢ = rand(Tb)
    
    # Calculate erosion depth
    erosion_depth = (Tbᵢ - Tsᵢ) / Tgᵢ
    
    # Store the result
    erosion_depths[i] = erosion_depth
end

# Calculate the mean and standard deviation of the results
mean_erosion_depth = round(mean(erosion_depths), digits=2)
std_erosion_depth = round(std(erosion_depths), digits=2)
#mean_erosion_depth = mean(erosion_depths)
#std_erosion_depth = std(erosion_depths)
min_e = round(mean_erosion_depth - std_erosion_depth, digits=2)
max_e = round(mean_erosion_depth + std_erosion_depth, digits=2)

# Print the results
println("Average exhumation depth: $mean_erosion_depth km")
println("Standard deviation: $std_erosion_depth km")
println("Exh minimum/maximum: $min_e km to $max_e km")
## ---