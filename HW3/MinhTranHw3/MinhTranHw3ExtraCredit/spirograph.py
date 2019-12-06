import sys
import numpy as np
import math
import matplotlib.pyplot as plt

# Accept float command-line arguments R, r, and a.
# Draw a curve formed by rolling a smaller circle of radius r inside
# a larger circle or radius R. If the pen offset of the pen point in
# the moving circle is a, then the equation of the resulting curve
# at time t is
#
# x(t) = (R+r)*cos((r/R)*t) - a*cos((1+r/R)*t)
# y(t) = (R+r)*sin((r/R)*t) - a*sin((1+r/R)*t)
# Loop through t from 0.00 to n*Pi in steps of 0.01 (n>2)


# R = float(sys.argv[1])
# r = float(sys.argv[2])
# a = float(sys.argv[3])

# y(t)= (R+r)*sin(t) - (r+a)*sin(((R+r)*t)/r)

def spiro(R=8, r=1, a=4):
    n = 3
    x = []
    y = []
    for t in np.arange(0, n*math.pi, 0.01):
        x.append((R + r) * math.cos(t) - (r + a) * math.cos(((R + r) * t) / r))
        y.append((R + r) * math.sin(t) - (r + a) * math.sin(((R + r) * t) / r))
    return x, y

def main():
    # Coordinate of SGM building
    lat = 34.021214
    lng = -118.289042

    # Run
    x, y = spiro()


    # Plot:
    # plt.figure()
    # plt.plot(x, y, 'bo')  # plot x and y using blue circle markers
    # plt.show()

    # WRITTING OUTPUT FILE ###
    fileOut = open("spiro.txt", "w")

    # Centralize the plot around the SGM
    for iter in range(len(x)):
        x[iter] += lat
        y[iter] += lng
        fileOut.write(str(y[iter]) + "," + str(x[iter]) + ",0.\n")

    # Close the file
    fileOut.close()
main()